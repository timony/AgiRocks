package agirocks

import grails.converters.JSON
import grails.transaction.Transactional
import org.springframework.web.servlet.ModelAndView
import sun.management.Agent

import static org.springframework.http.HttpStatus.*

@Transactional(readOnly = true)
class TeamController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    // Export service provided by Export plugin
    def exportService

    def autoCompletionService


    def index(Integer max) {
        if (!session.currentCompetition) {
            flash.error = message(code: 'not.selected.message', args: [Competition.class.simpleName])
            redirect controller: 'competition', action: 'index'
            return
        }

        //params.max = Math.min(max ?: 10, 100)
        params.max = Math.min(max ?: 1000, 1000)

        def days = Competition.get(session.currentCompetition.id).days

        respond Team.findAllByCompetition(session.currentCompetition, params), model: [teamCount: Team.count(), days: days]
    }

    def show(Team team) {
        respond team
    }

    def create() {
        respond new Team(params)
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
                def teamList = Team.find {}
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
                redirect team
            }
            '*' { respond team, [status: OK] }
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

    def breedList = {
        render autoCompletionService.breedList(params) as JSON
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
