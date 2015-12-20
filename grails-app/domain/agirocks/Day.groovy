package agirocks

class Day {

    Date date

    static belongsTo = [competition: Competition]

    static hasMany = [runs: Run, checkedTeams: Team]

    @Override
    String toString() {
        return date.format('yyyy-MM-dd')
    }

    static constraints = {
        date min: new Date()
    }
}
