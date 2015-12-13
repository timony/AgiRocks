package agirocks

class Day {

    Date date

    static belongsTo = [competition: Competition]

    static hasMany = [runs: Run, checkedTeams: Team]


    static constraints = {
    }
}
