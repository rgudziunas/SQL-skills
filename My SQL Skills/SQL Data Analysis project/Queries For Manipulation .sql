--SELECT COUNT(*) AS TotalRows   -- highlight this line (or the two lines)
--FROM   Project.dbo.CovidVaccinations;

--SELECT COLUMN_NAME, DATA_TYPE
--FROM   INFORMATION_SCHEMA.COLUMNS
--WHERE  TABLE_NAME = 'CovidDeaths'    -- or sys.columns / SSMS designer

Select *
From Project..CovidDeaths
Order by 3,4

-- Select the data that we will be using

Select Location, date, total_cases, new_cases, total_deaths, population
From Project..CovidDeaths
Order by 1,2

-- Total deaths vs Total cases
Select Location, date, total_cases,  total_deaths, CAST(total_deaths AS decimal(18,4)) / total_cases *100 as DeathRatio
From Project..CovidDeaths
Where location like '%state%'
Order by 1,2

-- Total cases vs Population
Select Location, date, total_cases,  total_deaths, population, CAST(total_cases AS decimal(18,4)) / population *100 as PercentOfPopulationInfected
From Project..CovidDeaths
Where location like '%state%'
Order by 1,2

-- Looking at Countries with highest infection rates compared to population
Select Location,  population, max(total_cases) as HighestInfectionCount, max(CAST(total_cases AS decimal(18,4))) / population *100 as PercentOfPopulationInfected
From Project..CovidDeaths
group by location, population
Order by 1,2

-- Showing countries with highest Death Count per population
Select location, max(Total_deaths) as DeathCount
From Project..CovidDeaths
Where continent is not null
group by location
order by DeathCount desc

-- Same thing but per continent
Select continent, max(Total_deaths) as DeathCount
From Project..CovidDeaths
Where continent is not null
group by continent
order by DeathCount desc

-- Global numbers

Select  Sum(new_cases) as NewCases, Sum(new_deaths) as Deaths, CAST(SUM(new_deaths) AS decimal(18,4))/ SUM(new_cases) * 100 AS DeathPercentage
From Project..CovidDeaths
Where continent is not null
order by 1,2

-- Loking at total population vs vaccinations
Select death.continent, death.location, death.date, death.population, vaccine.new_vaccinations
From Project..CovidDeaths death
Join Project..CovidVaccinations vaccine
	On death.location = vaccine.location and death.date = vaccine.date
where death.continent is not null
order by 1,2,3