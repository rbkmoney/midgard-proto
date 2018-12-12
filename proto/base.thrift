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

/** список возможных команд для клирингвого сервиса */
enum ClearingCommand {
    /** Запуск клиринга */
    START_CLEARING
}

/** Состояние клирингового события */
enum ClearingState {
    /** Клиринговое событие создано */
    CREATED
    /** Клиринговое событие запущено */
    EXECUTE
    /** Клиринговое событие успешно выполнено */
    SUCCESS
    /** Ошибка при выполнении клирингового события */
    FAILED
}

/** Описание сущности "Транзакция" */
struct Transaction {
    1: required string invoiceId
    2: required string docId
    3: required string transactionId
    4: required Timestamp transactionDate
    5: required Long transactionAmount
    6: required string transactionCurrency
    7: required string transactionType
    8: required string bankName
    9: required string payerBankCardToken
    10: required string payerBankCardPaymentSystem
    11: required string payerBankCardBin
    12: required string payerBankCardMaskedPan
    13: required string payerBankCardTokenProvider
    14: required string accountTypeFrom
    15: required string accountTypeTo
    16: required string approvalCode
    17: required string cardCaptureCapability
    18: required string cardDataInputCapability
    19: required string cardDataInputMode
    20: required string cardDataOutputCapability
    21: required string cardPresence
    22: required string cardholderAuthCapability
    23: required string cardholderAuthEntity
    24: required string cardholderAuthMethod
    25: required string cardholderPresence
    26: required string eCommerceSecurityLevel
    27: required Int mcc
    28: required string merchantId
    29: required Int messageFunctionCode
    30: required Int messageReasonCode
    31: required Int messageTypeIdentifier
    32: required string operationalEnvironment
    33: required string pinCaptureCapability
    34: required string terminalDataOutputCapability
    35: required string terminalId
    36: required string rrn
    37: required string responseCode
    38: required string systemTraceAuditNumber
}

/** Описание сущности "Мерчант" */
struct Merchant {
    1: required string merchantId
    2: required string merchantName
    3: required string merchantAddress
    4: required string merchantCountry
    5: required string merchantCity
    6: required string merchantPostalCode
}

/** Набор данных, подлежащий интерпретации согласно типу содержимого. */
struct Content {
    /** Тип содержимого, согласно [RFC2046](https://www.ietf.org/rfc/rfc2046) */
    1: required string type
    2: required binary data
}