namespace java com.rbkmoney.midgard
namespace erlang midgard

include "base.thrift"

struct FailureTransactionData {
    1: required string                   transaction_id
    2: required string                   comment
}

struct FailureClearingData {
    1: required base.ClearingID              clearing_ig
    2: required base.ClearingEventState      clearing_state
    3: optional list<FailureTransactionData> failure_transactions
}

struct ClearingDataPackage {
    2: required base.ClearingID          clearing_id
    3: required i64                      package_number
    4: required bool                     final_package
    5: required list<base.Transaction>   transactions
    6: required list<base.Merchant>      merchants
}

exception ClearingAdapterException {}

exception ClearingServiceException {}

/** Интерфейс взаимодействия с клиринговым адаптером банка */
service ClearingAdapterInf {
    /** Команда на запуск клирингового эвента на стороне адаптера */
    void StartClearingEvent(1: base.ClearingID clearing_id) throws(1: ClearingAdapterException ex1)
    /** Отправка данных в клиринговый адаптер */
    void SendClearingDataPackage(1: ClearingDataPackage clearing_data_package) throws (1: ClearingAdapterException ex1)
    /** Получение статуса клирингового события от адаптера */
    base.ClearingEventState GetClearingState(1: base.ClearingID clearing_id) throws (1: ClearingAdapterException ex1)
    /** Получение ответа по клиринговому эвенту от банка */
    FailureClearingData GetBankResponse(1: base.ClearingID clearing_id) throws(1: ClearingAdapterException ex1)
}

/** Интерфейс взаимодействия с клиринговым сервисом */
service ClearingServiceInnerInf {
    /** Получение данных из клирингового сервиса */
    ClearingDataPackage GetClearingData(1: base.ClearingID clearing_id,
                                        2: i64 package_number) throws (1: ClearingServiceException ex1)
}