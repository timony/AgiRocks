package agirocks

class Run {

    String name
    int length
    int obstacleCount
    String referee

    RunType type

    static  belongsTo = [day: Day]

    static constraints = {
        name: unique: 'day.competion'
        type blank: false, nullable: false
    }
}
