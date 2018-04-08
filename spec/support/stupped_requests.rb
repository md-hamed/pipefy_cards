module StubbedRequests
  # Stubs any get request to Pipefy API https://app.pipefy.com/queries
  def stub_show_organization_request(body: '')
    stub_request(:post, "https://app.pipefy.com/queries").with(
      headers: {
      'Accept'=>'*/*',
      'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
      'Content-Type'=>'application/json',
      'User-Agent'=>'Faraday v0.14.0'
       }).to_return(status: 200, body: body, headers: {})
  end
end
