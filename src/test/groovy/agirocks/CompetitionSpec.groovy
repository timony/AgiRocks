package agirocks

import grails.test.mixin.TestFor
import spock.lang.Specification

/**
 * See the API for {@link grails.test.mixin.domain.DomainClassUnitTestMixin} for usage instructions
 */
@TestFor(Competition)
class CompetitionSpec extends Specification {

    def setup() {
    }

    def cleanup() {
    }

    void "test competition created successfuly"() {
        when:
        Competition competition = new Competition(name: "C1")
        assert competition.validate()
        competition.save()

        then:
            Competition.findAllByName("C1").size() == 1
    }
}
