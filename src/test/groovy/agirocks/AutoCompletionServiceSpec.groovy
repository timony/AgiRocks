package agirocks

import grails.test.mixin.TestFor
import grails.test.mixin.integration.Integration
import grails.transaction.Rollback
import org.springframework.beans.factory.annotation.Autowired
import spock.lang.Specification

/**
 * See the API for {@link grails.test.mixin.services.ServiceUnitTestMixin} for usage instructions
 */
@Integration
@Rollback
class AutoCompletionServiceSpec extends Specification {

    @Autowired
    AutoCompletionService service

    def setupData() {
    }

    def setup() {
    }

    def cleanup() {
    }

    void "test breed list returned"() {
        when:
        Competition competition = new Competition(name: "C1")
        competition.save()

        Team team = new Team(firstName: 'F1', sureName: 'S1', dogName: 'D1', category: Category.A1, size: Size.L, breed: 'Breed1')
        team.save()

        then:
        service.breedList().size() == 1
    }
}
