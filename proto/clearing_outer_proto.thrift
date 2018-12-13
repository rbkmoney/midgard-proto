namespace java com.rbkmoney.midgard
namespace erlang midgard

include "base.thrift"

/** Команда, поступающая от внешнего сервиса */
struct ClearingEvent {
    1: required base.EventID          event_id
    2: required base.ClearingCommand  command
    3: required base.Bank             bank
    4: optional base.Timestamp        date_from
    5: optional base.Timestamp        date_to
}

/** Ответ от сервиса клиринга */
struct ClearingStateResponse {
    1: required base.EventID          event_id
    2: required base.ClearingState    clearing_state
    3: optional base.Bank             bank
    4: optional base.ClearingID       clearing_id
}

exception NoClearingEvent {}

/** Интерфейс взаимодействия между внешней системой и клиринговым сервисом */
service ClearingServiceOuterInf {
    /** Запуск события в клиринговом сервисе */
    void StartClearingEvent(1: ClearingEvent clearingEvent) throws ()
    /** Получение статуса клирингового события */
    ClearingStateResponse GetClearingEventState(1: base.EventID event_id) throws (1: NoClearingEvent ex1)
}