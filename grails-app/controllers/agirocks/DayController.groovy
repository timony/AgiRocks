package agirocks

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class DayController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Day.findAllByCompetition(session.currentCompetition), model:[dayCount: Day.count()]
    }

    def show(Day day) {
        respond day
    }

    def setCurrrentDay(Day day) {
        session["currentDay"] = day
        redirect(action: 'show', params: [id: day.id])
    }

    def create() {
        Competition competition = Competition.get(params.competitionId)
        respond new Day(competition: competition, date: new Date() + 1)
    }

    @Transactional
    def save(Day day) {
        if (day == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        if (day.hasErrors()) {
            transactionStatus.setRollbackOnly()
            respond day.errors, view:'create'
            return
        }
        
        day.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'day.label', default: 'Day'), day.id])
                redirect day.competition
            }
            '*' { respond day.competition, [status: CREATED] }
        }
    }

    def edit(Day day) {
        respond day
    }

    @Transactional
    def update(Day day) {
        if (day == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        if (day.hasErrors()) {
            transactionStatus.setRollbackOnly()
            respond day.errors, view:'edit'
            return
        }

        day.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'day.label', default: 'Day'), day.id])
                redirect day.competition
            }
            '*'{ respond day.competition, [status: OK] }
        }
    }

    @Transactional
    def delete(Day day) {

        if (day == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        Competition competition = day.competition
        day.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'day.label', default: 'Day'), day.id])
                redirect competition
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'day.label', default: 'Day'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
