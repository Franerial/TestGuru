class GistQuestionService
  attr_reader :client

  Result = Struct.new(:id, :url, :status_code) do
    def success?
      status_code == 201
    end
  end

  def initialize(question, client: nil)
    @question = question
    @test = @question.test
    @client = client || Octokit::Client.new(:access_token => ENV.fetch("GIST_ACCESS_TOKEN"))
  end

  def call
    @client.create_gist(gist_params)
    Result.new(@client.last_response.data[:id], @client.last_response.data[:html_url], @client.last_response.status)
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
