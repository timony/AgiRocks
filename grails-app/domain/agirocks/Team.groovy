package agirocks

class Team {

    String firstName
    String sureName
    String dogName
    String nick
    String breed

    String osa
    String kennel

    long workingBookNumber

    Category category
    Size size

    static hasMany = [days: Day]

    static belongsTo = Day

    static mapping = { category(type: Category)
        size(type: Size) }

    static constraints = {
    }
}
