namespace java com.rbkmoney.midgard
namespace erlang midgard

include "base.thrift"

struct AdapterResponse {
    1: required base.ClearingID      clearing_id
    2: required base.Content         content
}

service ClearingAdapterRequest {

    base.ClearingState GetClearingState(1: base.ClearingID clearing_id) throws (1: AdapterResponseException ex1)

    base.Content GetClearingResponse(1: base.ClearingID clearing_id) throws (1: AdapterResponseException ex1)

}

exception AdapterResponseException {}