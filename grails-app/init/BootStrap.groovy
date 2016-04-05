import agirocks.*

class BootStrap {

    def init = { servletContext ->
        Competition c1 = new Competition(name: "Competition 1").save(failOnError: true)

        Day day1 = new Day(competition: c1, date: new Date() + 20).save(failOnError: true)
        Day day2 = new Day(competition: c1, date: new Date() + 21).save(failOnError: true)

        new Team(workingBookNumber: '002414', firstName: 'Tomas', sureName: 'Mika', size: Size.L, category: Category.A3, dogName: 'Witty', competition: c1).save(failOnError: true)

        new Run(name: "D1 - Run 1", day: day1, obstacleCount: 18, length: 200, referee: "Some referee").save(failOnError: true)
        new Run(name: "D1 - Run 2", day: day1, obstacleCount: 20, length: 187, referee: "Some referee").save(failOnError: true)
        new Run(name: "D2 - Run 1", day: day2, obstacleCount: 19, length: 176, referee: "Some other referee").save(failOnError: true)

    }
    def destroy = {
    }
}
