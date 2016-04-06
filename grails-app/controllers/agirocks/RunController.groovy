package agirocks

import grails.transaction.Transactional

import static org.springframework.http.HttpStatus.*

@Transactional(readOnly = true)
class RunController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Run.list(params), model:[runCount: Run.count()]
    }

    def show(Run run) {
        respond run
    }

    def create() {
        Day day = Day.get(params.dayId)
        Competition competition = session["currentCompetition"]
        def days  = Day.findAllByCompetition(competition)
        respond new Run(day: day), model:[dayList: days]
    }

    def setCurrrentRun(Run run) {
        session["currentRun"] = run
        redirect(action: 'show', params: [id: run.id])
    }

    @Transactional
    def save(Run run) {
        if (run == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        if (run.hasErrors()) {
            transactionStatus.setRollbackOnly()
            respond run.errors, view:'create'
            return
        }

        run.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'run.label', default: 'Run'), run.id])
                redirect run
            }
            '*' { respond run, [status: CREATED] }
        }
    }

    def edit(Run run) {
        Competition competition = session["currentCompetition"]
        def days  = Day.findAllByCompetition(competition)
        respond run, model:[dayList: days]
    }

    @Transactional
    def update(Run run) {
        if (run == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        if (run.hasErrors()) {
            transactionStatus.setRollbackOnly()
            respond run.errors, view:'edit'
            return
        }

        run.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'run.label', default: 'Run'), run.id])
                redirect run
            }
            '*'{ respond run, [status: OK] }
        }
    }

    @Transactional
    def delete(Run run) {

        if (run == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        Day day = run.day
        run.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'run.label', default: 'Run'), run.id])
                redirect day
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'run.label', default: 'Run'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
