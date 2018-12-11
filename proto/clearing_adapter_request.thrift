namespace java com.rbkmoney.midgard
namespace erlang midgard

include "base.thrift"

struct ClearingData {
    1: required base.Bank            bank
    2: required base.ClearingID      clearing_id
    3: required base.Long            package_number
    4: required bool                 final_package
    5: required list<base.Content>   transactions
    6: required list<base.Content>   merchants
}

service ClearingAdapterRequest {

    base.Int SendClearingData(1: ClearingData clearingData) throws (1: SendClearingDataException ex1)

}

exception SendClearingDataException {}