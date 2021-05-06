class GistQuestionService
  attr_reader :client

  def initialize(question, client: nil)
    @question = question
    @test = @question.test
    @client = client || Octokit::Client.new(:access_token => ENV.fetch("GIST_ACCESS_TOKEN"))
  end

  def call
    @client.create_gist(gist_params)
    result = OpenStruct.new
    result.id = @client.last_response.data[:id]
    result.url = @client.last_response.data[:html_url]
    result.success = @client.last_response.data[:id].present?
    result
  end

  private

  def gist_params
    {
      description: I18n.t("gist_question_service.description", test: @test.title),
      files: {
        "test-guru-question.txt" => {
          content: gist_content,
        },
      },
    }
  end

  def gist_content
    [@question.body, *@question.answers.pluck(:body)].join("\n")
  end
end
