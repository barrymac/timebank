package timebank

import org.joda.time.LocalDate
import org.joda.time.LocalDateTime

class Exchange {

    User provider
    User receiver
    LocalDateTime startTime
    LocalDateTime endTime
    LocalDate date

    static constraints = {
        date(nullable: true, unique: true)
    }

//    transient Period timeTaken = new Period(startTime, endTime, PeriodType.yearMonthDayTime()).toString()
//        Period period =
//        return period
//    }
}
