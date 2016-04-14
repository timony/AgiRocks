package agirocks

import grails.converters.JSON
import grails.transaction.Transactional
import org.springframework.web.servlet.ModelAndView
import sun.management.Agent

import static org.springframework.http.HttpStatus.*

@Transactional(readOnly = true)
class TeamController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE", doImport: "POST"]

    // Export service provided by Export plugin
    def exportService

    def autoCompletionService
    def importService
    def registrationService


    def index(Integer max) {
        if (!session.currentCompetition) {
            flash.error = message(code: 'not.selected.message', args: [Competition.class.simpleName])
            redirect controller: 'competition', action: 'index'
            return
        }

        //params.max = Math.min(max ?: 10, 100)
        params.max = Math.min(max ?: 1000, 1000)

        def days = Competition.get(session.currentCompetition.id).days

        def teams = Team.findAllByCompetition(session.currentCompetition, params)
        respond teams, model: [teamCount: teams.size(),
                               days: days,
                               teamLCount: teams.count {Size.L == it.size},
                               teamMCount: teams.count {Size.M == it.size},
                               teamSCount: teams.count {Size.S == it.size},
                               teamA1Count: teams.count {Category.A1 == it.category},
                               teamA2Count: teams.count {Category.A2 == it.category},
                               teamA3Count: teams.count {Category.A3 == it.category},
                               paidSum: teams.sum {it.paid},
                               paidCount: teams.count {it.paid > 0},
                               notPaidCount: teams.count {it.paid == 0}
        ]
    }

    def show(Team team) {
        respond team
    }

    def create() {
        respond new Team(params)
    }

    def importTeams() {
    }

    def doImport() {
        def file = request.getFile('inputFile')
        if (file.empty) {
            flash.message = 'File cannot be empty'
            render view" 'importTeams"
            return
        }
        importService.kacrImportWithMapper(file, session.currentCompetition)

        redirect action: 'index'
    }

    @Transactional
    def save(Team team) {
        if (team == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        if (team.hasErrors()) {
            transactionStatus.setRollbackOnly()
            respond team.errors, view: 'create'
            return
        }

        team.save flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'team.label', default: 'Team'), team.id])
                redirect action: 'index'
            }
            '*' {
                redirect action: 'index'
            }
        }
    }

    def edit(Team team) {
        respond team
    }

    @Transactional
    def update(Team team) {
        if (team == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        if (team.hasErrors()) {
            transactionStatus.setRollbackOnly()
            respond team.errors, view: 'edit'
            return
        }

        team.save flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'team.label', default: 'Team'), team.id])
                redirect action: "index", method: "GET"
            }
            '*' { redirect action: "index", method: "GET" }
        }
    }

    @Transactional
    def delete(Team team) {

        if (team == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        team.delete flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'team.label', default: 'Team'), team.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NO_CONTENT }
        }
    }

    def testPrintPdf() {
        if (!params.max) params.max = 10

        if (params?.f && params.f != "html") {
            response.contentType = grailsApplication.config.grails.mime.types[params.f]
            response.setHeader("Content-disposition", "attachment; filename=teams.${params.extension}")


            List fields = ['firstName', 'sureName', 'dogName']
            Map labels = ["firstName": "First Name", 'sureName': 'Sure Name', "dogName": "Dog"]

            // Formatter closure
            def upperCase = { domain, value ->
                return value.toUpperCase()
            }

            Map formatters = [firstName: upperCase]
            Map parameters = [dogName: "Cool dogs", "column.widths": [0.2, 0.3, 0.5]]

            exportService.export(params.f, response.outputStream, Team.list(params), fields, labels, formatters, parameters)
        }

        redirect action: 'index', method: 'GET'


    }

    def json() {
        render Team.list() as JSON
    }

    def toggleRegistered = {
        response.status = 200
        render registrationService.registerTeamToDay(params)
    }

    def breedList = {
        response.status = 200
        render autoCompletionService.teamParamList(params, 'breed') as JSON
    }

    def osaList = {
        response.status = 200
        render autoCompletionService.teamParamList(params, 'osa') as JSON
    }

    def kennelList = {
        response.status = 200
        render autoCompletionService.teamParamList(params, 'kennel') as JSON
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'team.label', default: 'Team'), params.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NOT_FOUND }
        }
    }

}
