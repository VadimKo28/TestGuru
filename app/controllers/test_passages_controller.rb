class TestPassagesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_test_passage, only: %w[show result update]

  def show
  end

  def result
    CheckBadges.new(test_passage: @test_passage).call
  end

  def update
    @test_passage.accept!(params['answer_ids'])

    if @test_passage.completed?
      TestsMailer.completed_test(@test_passage).deliver_now

      @test_passage.update_success!

      redirect_to result_test_passage_path(@test_passage)
    else
      render :show
    end
  end

  private

  def set_test_passage
    @test_passage = TestPassage.find(params[:id])
  end
end
