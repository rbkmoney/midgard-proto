namespace java com.rbkmoney.midgard
namespace erlang midgard

include "base.thrift"

exception NoClearingEvent {}

enum ClearingCommand {
    /** Запуск клиринга */
    START_CLEARING,
    /** Получение статуса клиринга */
    //GET_CLEARING_STATUS,
    /** Создание отчета по клиринговым операциям */
    CREATE_REPORT
}

struct ClearingEvent {
    1: required base.EventID          event_id
    2: required ClearingCommand       command
    3: required base.Bank             bank
    4: optional base.Timestamp        date_from
    5: optional base.Timestamp        date_to
}

struct ClearingStateResponse {
    1: required base.EventID          event_id
    2: required base.ClearingID       clearing_id
    3: required base.Bank             bank
    4: required ClearingState         clearing_state
}

service Clearing {

    void StartClearingEvent(1: ClearingEvent clearingEvent) throws ()

    ClearingStateResponse GetClearingEventState(1: base.EventID event_id) throws (1: NoClearingEvent ex1)

}