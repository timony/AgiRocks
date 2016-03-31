package agirocks

import au.com.bytecode.opencsv.CSVReader
import grails.transaction.Transactional
import org.springframework.web.multipart.MultipartFile

@Transactional(readOnly = false)
class ImportService {

    static
    def mapping = ['workingBookNumber': 0, "firstName": 1, 'sureName': 2, 'dogName': 3, 'kennel': 4, 'breed': 5, 'size': 6, 'category': 10]

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

            def field = convertToField(key, cell)
            team."$key" = field
        }
        team
    }

    def convertToField(def key, def cell) {
        switch (key) {
            case 'size':
                Size.valueOf(cell)
                break
            case 'category':
                Category.valueOf(cell)
                break
            case 'workingBookNumber':
                '0'.equals(cell) ? null : cell
                break
            default:
                cell
        }
    }

}
