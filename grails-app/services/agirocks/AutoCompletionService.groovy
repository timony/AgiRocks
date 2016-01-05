package agirocks

import grails.transaction.Transactional

@Transactional(readOnly = true)
class AutoCompletionService {

    def teamParamList(params, property) {
        def results = Team.withCriteria {
            isNotNull(property)
            ilike(property, "%${params.term}%")
            projections {
                distinct(property)
            }
        }
        results
    }
    
}
