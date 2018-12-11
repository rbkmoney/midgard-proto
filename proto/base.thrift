namespace java com.rbkmoney.midgard
namespace erlang midgard

typedef i16 Short
typedef i32 Int
typedef i64 Long
/**
 * Отметка во времени согласно RFC 3339.
 *
 * Строка должна содержать дату и время в UTC в следующем формате:
 * `2016-03-22T06:12:27Z`.
 */
typedef string Timestamp
/** ID события на стороне вызывающего сервиса */
typedef i64 EventID
/** ID события на стороне сервиса клиринга */
typedef i64 ClearingID

/** Список доступных для клиринга банков */
enum Bank {
    /** МТС банк */
    MTS
}

/** Состояние клирингового события */
enum ClearingState {
    /** Клиринговое событие создано */
    CREATED,
    /** Клиринговое событие запущено */
    EXECUTE,
    /** Клиринговое событие успешно выполнено */
    SUCCESS,
    /** Ошибка при выполнении клирингового события */
    FAILED
}

/** Набор данных, подлежащий интерпретации согласно типу содержимого. */
struct Content {
    /** Тип содержимого, согласно [RFC2046](https://www.ietf.org/rfc/rfc2046) */
    1: required string type
    2: required binary data
}