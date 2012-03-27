package timebank

import org.joda.time.LocalDateTime

class Exchange {

    User provider
    User receiver
    LocalDateTime startTime
    LocalDateTime endTime

    static constraints = {
    }

//    transient Period timeTaken = new Period(startTime, endTime, PeriodType.yearMonthDayTime()).toString()
//        Period period =
//        return period
//    }
}
