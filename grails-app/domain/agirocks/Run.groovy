package agirocks

class Run {

    String name
    int length
    int obstacleCount
    String referee

    static  belongsTo = [day: Day]

    static constraints = {
    }
}
