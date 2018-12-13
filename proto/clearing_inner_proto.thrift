namespace java com.rbkmoney.midgard
namespace erlang midgard

include "base.thrift"

struct RequestClearingData {
    1: required base.Bank                bank
    2: required base.ClearingID          clearing_id
    3: required base.Long                package_number
    4: required bool                     final_package
    5: required list<base.Transaction>   transactions
    6: required list<base.Merchant>      merchants
}

struct ResponseTransaction {
    1: required string                   transaction_id
    2: required string                   comment
}

struct ResponseClearingData {
    1: required base.ClearingID           clearing_ig
    2: required base.ClearingState        clearing_state
    3: optional list<ResponseTransaction> response_transactions
}

exception ClearingAdapterException {}

exception ClearingServiceException {}

/** Интерфейс взаимодействия с клиринговым адаптером банка */
service ClearingAdapterInf {
    /** Команда на запуск клирингового эвента на стороне адаптера */
    base.Int StartClearingEvent(1: base.ClearingID clearing_id) throws(1: ClearingAdapterException ex1)
    /** Получение статуса клирингового события от адаптера */
    base.ClearingState GetClearingState(1: base.ClearingID clearing_id) throws (1: ClearingAdapterException ex1)
    /** Получение ответа по клиринговому эвенту от банка */
    ResponseClearingData GetBankResponse(1: base.ClearingID clearing_id) throws(1: ClearingAdapterException ex1)
}

/** Интерфейс взаимодействия с клиринговым сервисом */
service ClearingServiceInnerInf {
    /** Получение данных из клирингового сервиса */
    base.Int GetClearingData(1: RequestClearingData clearingData) throws (1: ClearingServiceException ex1)
}