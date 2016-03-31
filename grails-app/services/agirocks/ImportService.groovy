package agirocks

import au.com.bytecode.opencsv.CSVReader
import cz.timony.agiRocks.csv.ConverterFactory
import grails.transaction.Transactional
import org.springframework.web.multipart.MultipartFile

@Transactional(readOnly = false)
class ImportService {

    static
    def mapping = [
            'workingBookNumber' : 0,
            "firstName"         : 1,
            'sureName'          : 2,
            'dogName'           : 3,
            'kennel'            : 4,
            'breed'             : 5,
            'size'              : 6,
            'nick'              : 9,
            'category'          : 10,
            'contact'           : 11,
            'email'             : 12,
            'country'           : 17
    ]

    def kacrImportWithMapper(MultipartFile kacrFile, Competition competition) {
        InputStreamReader isReader = new InputStreamReader(kacrFile.inputStream)
        CSVReader reader = new CSVReader(isReader)

        reader.readNext() //skip header line

        String[] nextLine;

        while ((nextLine = reader.readNext()) != null) {

            Team team = mapToBean(nextLine, new Team());
            if (team.workingBookNumber) {
                Team present = Team.findByWorkingBookNumber(team.workingBookNumber)
                if (present) {
                    mapToBean(nextLine, present)
                    team = present
                }
            }

            team.competition = competition
            log.info("Validation results: ${team.validate()}")

            if (!team.save(flush: true)) {
                team.errors.each {
                    log.error(it)
                }
            }
        }
    }

    def Team mapToBean(nextLine, team) {

        mapping.each { key, value ->
            String cell = nextLine[value]

            def field = ConverterFactory.getConverter(key).convert(cell)
            team."$key" = field
        }
        team
    }

}
