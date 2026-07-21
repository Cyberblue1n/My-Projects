<h1>Task 1 - Preference vs Work Type (No Change Needed)</h1>
Visualization: Clustered Bar Chart

**Task**
Create a clustered bar chart showing the relationship between Preference and Work Type, considering only jobs where Work Type = Intern.

<p>Apply the following filters:</p>
<ul>
<li>Company Size < 50,000</li>
<li>Salary > $9,000</li>
</ul>
Sort the chart in descending order based on the number of job postings.

<h1>Task 2 - Company Size Analysis (Replace Scatter Plot)</h1>

Instead of a Tableau Scatter Plot, use a Clustered Column Chart.

Visualization

Clustered Column Chart

X-Axis

Company Name

Y-Axis

Average Company Size

Filters
Company Size < 50,000
Job Title = Mechanical Engineer
Experience > 5 Years
Salary > $50,000
Work Type = Full-Time OR Part-Time
Preference = Male
Country belongs to Asia
Country does NOT start with "I"
Job Portal = Idealist
Company Name contains at least two vowels

Sort companies by Company Size.

Time Restriction

Instead of making the chart disappear between 3–5 PM (which Power BI Service can do only with refresh or custom solutions), create a DAX measure that displays a message:

"Visible only between 3 PM and 5 PM IST."

or remove the time restriction entirely.

<h1>Task 3 - Work Type Salary Distribution</h1>

Power BI supports Box Plot through custom visuals.

If you don't want custom visuals, use a Histogram + Salary Statistics Card.

Visualization

Histogram

Additional Cards
Average Salary
Median Salary
Maximum Salary
Minimum Salary
Filters
Work Type = Intern
Latitude < 10
Company Size < 50,000
Salary > $8,000
Job Title contains only one word
Job Title length < 10
Experience is an even number
Posting Year between 2021 and 2023
Contact Person contains letter "e"

<h1>Task 4 - India vs Germany Comparison</h1>

(No change needed)

Visualization

Stacked Column Chart

Axis

Country

Legend

Job Title

Values

Count of Job Postings

Filters
Country = India or Germany
Qualification = B.Tech
Work Type = Full-Time
Experience > 2
Job Title
Data Scientist
Art Teacher
Aerospace Engineer
Salary > $10,000
Job Portal = Indeed
Company Name length > 8
Location not blank

Use different colors for each country.

<h1>Task 5 - Top 10 Companies</h1>

Treemap is supported.

Visualization

Treemap

Group

Company Name

Values

Count of Jobs

Top N Filter

Top 10 Companies

Additional Filters
Role = Data Engineer
Job Title = Data Scientist
Country NOT in Asia
Country does NOT start with "C"
Company Size ≥ 10,000
Qualification = B.Tech
Preference = Female
Job Portal = LinkedIn
Posting Date between
01-Jan-2023
06-Jan-2023
Contact Person ends with a vowel

<h1>Task 6 - Qualification Drilldown Map</h1>

Power BI supports drill-down very well.

Visualization

Map

Location Hierarchy

Country

↓

State

↓

City

↓

Location

Latitude

Latitude

Longitude

Longitude

Bubble Size

Count of Jobs

Filters
African Countries
Qualification
B.Tech
M.Tech
PhD
Work Type = Full-Time
Job Title starts with D
Preference = Male
Company Size > 80,000
Salary > $20,000
Contact Person starts with A
Job Portal = Indeed

Enable Drill Down so users can click through from Country → State → City → Exact Location.

Instead of restricting visibility between 3 PM and 6 PM IST, display a card indicating the intended viewing window or omit the time-based requirement.

Final Dashboard Layout

You can combine everything into a professional 6-page Power BI dashboard.

<table>
    <tr>
        <th>Page</th>
        <th>Dashboard</th>
    </tr>
    <tr>
        <td>Page 1</td>
        <td>Executive Overview (KPIs + slicers + summary cards)</td>
    </tr>
    <tr>
        <td>Page 2</td>
        <td>Preference vs Internship Analysis</td>
    </tr>
    <tr>
        <td>Page 3</td>
        <td>Company Analysis (Mechanical Engineer Hiring)</td>
    </tr>
    <tr>
        <td>Page 4</td>
        <td>Salary Distribution & Statistics</td>
    </tr>
    <tr>
        <td>Page 5</td>
        <td>India vs Germany Comparison + Top Companies</td>
    </tr>
    <tr>
        <td>Page 6</td>
        <td>Geographic Analysis (Map + Drilldown)</td>
    </tr>
</table>
