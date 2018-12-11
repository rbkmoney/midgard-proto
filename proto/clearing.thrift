namespace java com.rbkmoney.midgard
namespace erlang midgard

include "base.thrift"

exception NoClearingEvent {}

/** список возможных команд для клирингвого сервиса */
enum ClearingCommand {
    /** Запуск клиринга */
    START_CLEARING,
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
    2: required base.ClearingState    clearing_state
    3: optional base.Bank             bank
    4: optional base.ClearingID       clearing_id
}

service Clearing {
    /** Запуск события в клиринговом сервисе */
    void StartClearingEvent(1: ClearingEvent clearingEvent) throws ()
    /** Получение статуса клирингового события */
    ClearingStateResponse GetClearingEventState(1: base.EventID event_id) throws (1: NoClearingEvent ex1)
}