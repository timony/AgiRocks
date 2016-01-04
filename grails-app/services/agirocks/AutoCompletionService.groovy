package agirocks

import grails.transaction.Transactional

@Transactional(readOnly = true)
class AutoCompletionService {

    def breedList(params) {
        def results = Team.withCriteria {
            isNotNull("breed")
            ilike("breed", "%${params.term}%")
            projections {
                distinct("breed")
            }
        }

        results
    }
}
