module StubbedRequests
  # Stubs any get request to Pipefy API https://app.pipefy.com/queries
  def stub_show_organization_request(body: '')
    stub_request(:post, "https://app.pipefy.com/queries").with(
      headers: {
      'Accept'=>'*/*',
      'Content-Type'=>'application/json',
       }).to_return(status: 200, body: body, headers: {})
  end
end
