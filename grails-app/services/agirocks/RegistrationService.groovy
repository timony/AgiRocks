package agirocks

import grails.transaction.Transactional

@Transactional
class RegistrationService {

    def registerTeamToDay(params) {


        def registered = params.registered.toBoolean()
        def team = Team.get(params.id)
        def day = Day.get(params.dayId)


        def competition = team?.competition

        Registration reg = Registration.findOrCreateByCompetitionAndDayAndTeam(competition, day, team)
        reg.registered = registered
        reg.save flush: true
    }

    def boolean isTeamRegistered(Team team, Day day) {
        Registration reg = Registration.findByTeamAndDay(team, day)
        return reg != null && reg.registered
    }

    def getRegistrationsByCompetition(Competition competition) {

        def teams = Team.findAllByCompetition(competition)
        def days = Day.findAllByCompetition(competition)

        def regs = [:]

        teams.each {team ->
            def dayRegs = [:]
            days.each {day ->
                dayRegs.put(day.id, isTeamRegistered(team, day))
            }
            regs.put(team.id, dayRegs)
        }

        regs
    }
}
