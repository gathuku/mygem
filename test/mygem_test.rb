require "test_helper"

class MygemTest < Minitest::Test
  def test_that_it_has_a_version_number
    refute_nil ::Mygem::VERSION
  end

  def test_it_registers_ulrls
    url="https://virtserver.swaggerhub.com/zegetech/mpesaUniAPI/1.0/mpesa/urls"
    headers={
      "accept"=>"application/vnd.api+json",
      "Content-Type"=>"application/vnd.api+json"
    }
    body={
      data:{
        type:"urls",
        id:1,
        attributes:{
          confirmation_url: "https://example.com/confirmation",
          validation_url: "https://example.com/validation",
          short_code: "600234",
          response_type: "Completed"
        }
      }
    }
    stub_request(:post,url).
    with(
      body:body.to_json,
      headers: headers
    ).
    to_return(status: 200, body:"", headers: {})

    assert_equal 200, Mygem.register_urls("Completed").status
  end

def  test_payouts
  url="https://virtserver.swaggerhub.com/zegetech/mpesaUniAPI/1.0/mpesa/payouts"
  headers={
    "accept"=>"application/vnd.api+json",
    "Content-Type"=>"application/vnd.api+json"
  }
  body={
    data:{
      type:"payouts",
      id:1,
      attributes: {
        category: "BusinessPayment",
        amount: 1000,
        recipient_no: "25472264885",
        recipient_type: "msisdn",
        posted_at: Time.now,
        recipient_id_type: "national_id",
        recipient_id_number: "12345567",
        reference: "142345654"
      }
    }
  }

  stub_request(:post,url).
  with(body: body.to_json, headers: headers).
  to_return(status: 200, body:"", headers:{})
  assert_equal 200, Mygem.payouts("BusinessPayment",1000,"25472264885","142345654").status
end

end
