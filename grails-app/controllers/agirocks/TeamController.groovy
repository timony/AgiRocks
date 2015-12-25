package agirocks

import grails.transaction.Transactional
import org.springframework.web.servlet.ModelAndView
import sun.management.Agent

import static org.springframework.http.HttpStatus.*

@Transactional(readOnly = true)
class TeamController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        if (!session.currentCompetition) {
            flash.error = message(code: 'not.selected.message', args: [Competition.class.simpleName])
            redirect controller: 'competition', action: 'index'
        }

        //params.max = Math.min(max ?: 10, 100)
        params.max = Math.min(max ?: 1000, 1000)

        def days = Competition.get(session.currentCompetition.id).days

        respond Team.findAllByCompetition(session.currentCompetition, params), model:[teamCount: Team.count(), days: days]
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
            respond team.errors, view:'create'
            return
        }

        team.save flush:true

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
            respond team.errors, view:'edit'
            return
        }

        team.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'team.label', default: 'Team'), team.id])
                redirect team
            }
            '*'{ respond team, [status: OK] }
        }
    }

    @Transactional
    def delete(Team team) {

        if (team == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        team.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'team.label', default: 'Team'), team.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'team.label', default: 'Team'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
