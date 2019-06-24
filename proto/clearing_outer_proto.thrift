namespace java com.rbkmoney.midgard
namespace erlang midgard

include "base.thrift"

/** ID провайдера */
typedef i32 ProviderID
/** ID события на стороне вызывающего сервиса */
typedef i64 EventID

/** Команда, поступающая от внешнего сервиса */
struct ClearingEvent {
    1: required EventID           event_id
    2: required ProviderID        provider_id
}

/** Ответ от сервиса клиринга */
struct ClearingEventStateResponse {
    1: required EventID                    event_id
    2: required base.ClearingEventState    clearing_state
    3: optional ProviderID                 provider_id
    4: optional base.ClearingID            clearing_id
}

exception NoClearingEvent {}

exception ProviderNotFound {}

/** Интерфейс взаимодействия между внешней системой и клиринговым сервисом */
service ClearingService {
    /** Запуск события в клиринговом сервисе */
    void StartClearingEvent(1: ClearingEvent clearingEvent) throws (1: ProviderNotFound ex1)
    /** Получение статуса клирингового события */
    ClearingEventStateResponse GetClearingEventState(1: EventID event_id) throws (1: NoClearingEvent ex1)
    /** Повторно отправить клиринговый файл для провайдера за определенный день (формат даты YYYY-MM-DD) */
    void ResendClearingFile(1: ProviderID provider_id, 2: string clearing_date) throws (1: NoClearingEvent ex1)
}