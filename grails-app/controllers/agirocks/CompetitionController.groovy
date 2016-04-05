package agirocks

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class CompetitionController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Competition.list(params), model:[competitionCount: Competition.count()]
    }

    def show(Competition competition) {
        respond competition
    }

    def setCurrrentCompetition(Competition competition) {
        session["currentCompetition"] = competition
        session["currentDay"] = null
        session["currentRun"] = null
        redirect(action: 'show', params: [id: competition.id])
    }

    def create() {
        respond new Competition(params)
    }

    @Transactional
    def save(Competition competition) {
        if (competition == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        if (competition.hasErrors()) {
            transactionStatus.setRollbackOnly()
            respond competition.errors, view:'create'
            return
        }

        competition.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'competition.label', default: 'Competition'), competition.id])
                redirect competition
            }
            '*' { respond competition, [status: CREATED] }
        }
    }

    def edit(Competition competition) {
        respond competition
    }

    @Transactional
    def update(Competition competition) {
        if (competition == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        if (competition.hasErrors()) {
            transactionStatus.setRollbackOnly()
            respond competition.errors, view:'edit'
            return
        }

        competition.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'competition.label', default: 'Competition'), competition.id])
                redirect competition
            }
            '*'{ respond competition, [status: OK] }
        }
    }

    @Transactional
    def delete(Competition competition) {

        if (competition == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        competition.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'competition.label', default: 'Competition'), competition.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'competition.label', default: 'Competition'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
