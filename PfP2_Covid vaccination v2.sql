
-- 1. Global Numbers
-- 1-a. Showing total vaccination count and percentage of vaccination per population of global as of September 16, 2021.

SELECT location, population, date, total_vaccinations as TotalVaccinationCount, people_vaccinated as FirstDoseCount
, people_fully_vaccinated as FullyVaccinatedCount, (people_vaccinated/population)*100 as PercentFirstDose, (people_fully_vaccinated/population)*100 as PercentFullyVaccinated
From CovidVac0916
Where location = 'World'
Order by date DESC
;

-- 2. Continent Numbers
-- 2-a. Showing  total vaccination count and percentage of vaccination per population of each continent as of September 16, 2021.

SELECT location, population, date, total_vaccinations as TotalVaccinationCount, people_vaccinated as FirstDoseCount, people_fully_vaccinated as FullyVaccinatedCount
, (people_vaccinated/population)*100 as PercentFirstDose, (people_fully_vaccinated/population)*100 as PercentFullyVaccinated
From CovidVac0916
Where continent is null and location not in ('International', 'European Union', 'World') and date = '2021-09-16'
Order by TotalVaccinationCount DESC
;

-- 3. Country Numbers
-- 3-a. Showing trends of the number and percentage of first dose count and fully vaccinated count

Select location, population, date, people_vaccinated as FirstDoseCount, people_fully_vaccinated as FullyVaccinatedCount
, (people_vaccinated/population)*100 as PercentFirstDose, (people_fully_vaccinated/population)*100 as PercentFullyVaccinated
From CovidVac0916
Where continent is not NULL
Order by 1, 3
;

-- 3-b. Showing  total vaccination count and percentage of vaccination per population of each country as of September 16, 2021.

SELECT location, population, date, total_vaccinations as TotalVaccinationCount, people_vaccinated as FirstDoseCount, people_fully_vaccinated as FullyVaccinatedCount
, (people_vaccinated/population)*100 as PercentFirstDose, (people_fully_vaccinated/population)*100 as PercentFullyVaccinated
From CovidVac0916
Where continent is not null and date = '2021-09-15'
Order by PercentFirstDose DESC
;

-- 3-c. Showing total vaccination count and percentage of vaccination per population of G7 countries as of September 15, 2021.

SELECT location, population, date, total_vaccinations as TotalVaccinationCount, people_vaccinated as FirstDoseCount, people_fully_vaccinated as FullyVaccinatedCount
, (people_vaccinated/population)*100 as PercentFirstDose, (people_fully_vaccinated/population)*100 as PercentFullyVaccinated
From CovidVac0916
Where continent is not null and location in ('United States', 'United Kingdom', 'Canada', 'France', 'Germany', 'Italy', 'Japan') and date = '2021-09-15'
Order by PercentFirstDose DESC
;

-- 3-d. Showing running total of new vaccination of each country (regardless firs/second dose)

Select location, population, date, new_vaccinations
, sum(new_vaccinations) Over (Partition by location Order by date) as RunningTotalOfNewVaccination
From CovidVac0916
Where continent is not NULL
Order by 1, 3
;

-- 3-e. Showing percentage of running total of new vaccination per population using by CTE

With PercentRunningTotal (location, population, date, new_vaccination, RunningTotalOfNewVaccination)
as
(
Select location, population, date, new_vaccinations
, sum(new_vaccinations) Over (Partition by location Order by date) as RunningTotalOfNewVaccination
From CovidVac0916
Where continent is not NULL
--Order by 1, 3
)
SELECT *, (RunningTotalOfNewVaccination/population)*100 as PercentRunningTotalOFNewVaccination
From PercentRunningTotal
;


-- 4. Advanced
-- 4-a. Showing the correlation between the progress of vaccination and GDP per capita

Select vac.iso_code, vac.location, vac. population, vac.date, vac. total_vaccinations as TotalVaccinationCount
, (vac.people_vaccinated/vac.population)*100 as PercentFirstDose, (vac.people_fully_vaccinated/vac.population)*100 as PercentSecondDose
, gdp.'2019' as GDP_per_capita_asof2019
From CovidVac0916 vac
Left Join gdp_per_capita gdp on vac.iso_code = gdp.CountryCode
Where vac.date = '2021-09-15' and vac.continent is not null
Order by GDP_per_capita_asof2019 DESC
;