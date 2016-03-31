import agirocks.Category
import agirocks.Competition
import agirocks.Day
import agirocks.Size
import agirocks.Team

class BootStrap {

    def init = { servletContext ->
        Competition c1 = new Competition(name: "Competition 1").save(failOnError: true)

        new Day(competition: c1, date: new Date() + 20).save(failOnError: true)
        new Day(competition: c1, date: new Date() + 21).save(failOnError: true)

        new Team(workingBookNumber: '002414', firstName: 'Tomas', sureName: 'Mika', size: Size.L, category: Category.A3, dogName: 'Witty', competition: c1).save(failOnError: true)
    }
    def destroy = {
    }
}
