package agirocks

class Registration {

    Day day
    Team team
    boolean registered

    static belongsTo = [competition: Competition]

    static constraints = {
    }
}
