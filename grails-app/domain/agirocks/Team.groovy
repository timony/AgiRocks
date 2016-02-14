package agirocks

import grails.rest.Resource

@Resource(uri = '/teams', formats = ['html', 'json'])
class Team {

    String firstName
    String sureName
    String dogName
    String getNickName() {nick?: nick; dogName}
    String getFullTeamName() {String.format('%s %s/%s', firstName, sureName, dogName)}

    String nick
    String breed

    String osa
    String kennel

    String workingBookNumber

    Category category
    Size size

    static belongsTo = [competition: Competition]

    static mapping = {
        category(type: Category)
        size(type: Size)
    }

    static constraints = {
        nick nullable: true
        workingBookNumber nullable: true, unique: 'competition'
        osa nullable: true
        kennel nullable: true
        breed nullable: true

    }

    static transients = ['nickName', 'fullTeamName']

    @Override
    String toString() {
        return String.format('%s %s / %s', firstName, sureName, dogName)
    }

}
