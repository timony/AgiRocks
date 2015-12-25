package agirocks

import cz.timony.agiRocks.AppConstants

class Day {

    Date date

    static belongsTo = [competition: Competition]

    static hasMany = [runs: Run]

    @Override
    String toString() {
        return date.format(AppConstants.DATE_FORMAT)
    }

    static constraints = {
        date min: new Date(), unique: 'competition'
    }
}
