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
}
