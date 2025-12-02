# RAP Skeleton

## What is the RAP Skeleton?

The RAP Skeleton is a reusable template for RAP projects. It uses the R coding language (written in line with the [tidyverse style guide](https://style.tidyverse.org/)) to create HTML statistical publications. The RAP Skeleton is stored as a repository on the Tech Lab GitHub page and can be accessed by downloading the repository as a ZIP file (Git knowledge is not required for this, see further instructions found below). The RAP Skeleton project contains two sections; the demo report and the skeleton template, further information on each is provided below. 

For users updating to the RAP Skeleton V3.0.0, please refer to the last three sections of the ReadMe.

<details open>
  <summary><strong>What's New in v3.0.0?</strong></summary>

#### 🧰 General review and update
The RAP skeleton underwent review and any unused or out of date parts of the code have been removed. The demo report also underwent accessibility testing and any issues found have been remedied.

#### 🧪 R 4.4.3 compatibility
All packages have been updated so the RAP Skeleton is fully compatible with R version 4.4.3; Use renv::restore to ensure all packages are synchronized.

#### 🗂️ Functions folder update
All the functions included in the RAP skeleton are now contained within individual R scripts and stored in the functions folder. This should improve user experience as the functions are easier to find and more clearly defined within the project. Each function also now has a brief description explaining what it does.

#### 📄 New f_worksheet function
A new, simplified function for writing out excel tables has been added to the skeleton. This new function fixes a few of the issues users were encountering with the original f_single_excel.R function such as missing data. The f_worksheet.R function allows multiple tables to be written to a single excel sheet and does not rely on externally set variables which is in line with good practice guidance. More information on how to use the f_worksheet.R function is provided in the *Creating Excel tables with the f_worksheet.R* function section below.

#### 🧩 ADR styling
ADR colours and logos have been added as styling options. Set nics-theme as "adr" in config.R to configure.

#### 📊 New chart options
New charts have been added: filled line chart, population pyramid, flow chart.

#### 📝 Annotations
The demo report includes a feature that lets users add annotations and save the annotated file. This feature can be toggled on or off in demo_report.R. At the top of the file, within the YAML section, set params: annotations: false to disable it.

#### 🌐 Data Portal Prep Script
An example script `code/demo/demo_data_portal_prep.R` has been added to the demo to demonstrate how the MYE data used in the demo report would be prepared for upload to the NISRA Data Portal.

#### 🔎 Meta HTML files added
This file `code/meta.html` has been added to the YAML of the report.Rmd file to improve search engine optimisation. This file should be updated with a description of the output and any key words which should be picked up if users are searching for the publication using a search engine.

</details>

<details>
  <summary><strong>Downloading the RAP Skeleton</strong></summary>

This code should run on most recent versions of RStudio but will need R 4.4.3 to run package installations correctly. If you do not have this, R 4.4.3 is available from the IT Assist Store.

In order to work with the RAP Skeleton the project folder must first be downloaded onto your local computer. Follow these steps to complete this process:

-   Download the RAP Skeleton as a ZIP file by clicking on the ‘Source code (zip)’ link under the ‘Assets’ tab on the [latest releases page](https://github.com/NISRA-Tech-Lab/rap-skeleton/releases). The file will be downloaded to the ‘Downloads’ folder on your PC.

-   Open your ‘Downloads’ folder using Windows Explorer and extract the RAP Skeleton contents by right-clicking on the ZIP file and selecting ‘Extract All’.

-   The RAP Skeleton will be contained within a folder with a name `rap-skeleton-`, followed by some numeric version numbers eg. `rap-skeleton-3.0`. In this README this will be referred to as `rap-skeleton-x.x`. Choose an appropriate location to save this folder e.g. your desktop.

</details>

<details>
  <summary><strong>Understanding the RAP Skeleton folder structure</strong></summary>

Once downloaded and extracted, you are now able to view the files and folders within the `rap-skeleton-x.x` folder.

Note:

-   `rap-skeleton.Rproj` (rap-skeleton-x.x/rap-skeleton.Rproj) is the main R project file for the RAP Skeleton. Always open this R project file first when working on any element of your report.

-   `report.Rmd` (rap-skeleton-x.x/code/report.Rmd) is the RMarkdown file that will be knitted to produce your HTML report.

-   `demo_report.Rmd` (rap-skeleton-x.x/code/demo/demo_report.Rmd) is the RMarkdown file that will be knitted to produce the demo HTML report.

-   Everything relating to the demo report is stored inside the `demo` folder (`rap-skeleton-x.x/code/demo/`). The entire `demo` folder can be deleted if it is not required.

The following table lists the RAP Skeleton contents and their purpose:

| Skeleton/Demo | File                            | Purpose                                                                                                                      |
|------------------------|------------------------|------------------------|
| Skeleton      | `code/report.Rmd`               | RMarkdown report                                                                                                             |
| Skeleton      | `code/excel_tables.R`           | Produce spreadsheet output                                                                                                   |
| Skeleton      | `code/data_prep.R`              | Data prep for report & spreadsheets                                                                                          |
| Skeleton      | `code/config.R`                 | Configuration file primarily for skeleton template (is also read into `demo_config.R`)                                       |
| Skeleton      | `code/meta.html`                | HTML script with meta tags that is called in the YAML of the report.Rmd file to improve serach engine optimisation           |
| Skeleton      | `data/`                         | Store your raw data files here (if your code is not stored on GitHub). Otherwise, connect to external data eg. on a shared drive or SQL server, you can specify that in config.R |
| Skeleton      | `outputs/`                      | HTML and Excel outputs will be saved here                                                                                    |
| Skeleton      | `.gitignore`                    | A list of files and folders that you wish to be ignored by Git. These will not be uploaded to your Github repo if using one. |
|               |                                 |                                                                                                                              |
| Demo          | `code/demo/demo_report.Rmd`     | Demo RMarkdown report                                                                                                        |
| Demo          | `code/demo/demo_excel_tables.R` | Original script to produce demo spreadsheet output                                                                           |
| Demo          | `code/demo/demo_excel_tables_new.R` | New script to produce demo spreadsheet output which uses f_worksheet.R function                                          |
| Demo          | `code/demo/demo_data_prep.R`    | Data prep for demo report & demo spreadsheets                                                                                |
| Demo          | `code/demo/demo_data_portal_prep.R`| Data prep to prepare date for upload to the NISRA Data Portal                                                             |
| Demo          | `code/demo/demo_config.R`       | Configuration for demo only                                                                                                  |
| Demo          | `code/demo/demo_data/`          | Raw data for the demo is stored here                                                                                         |
| Demo          | `code/demo/demo_outputs/`       | Demo HTML and Excel outputs will be saved here                                                                               |
</details>

<details>
  <summary><strong>Demo Report</strong></summary>
  
A demo HTML project is included within the RAP Skeleton project. The purpose of the demo is to:

-   View, explore and interact with a demo HTML report.

-   Show the file structure and set-up needed to organise and produce an HTML report. Use the demo to learn more about the `report.Rmd` file as well as the associated `config.R`, `data_prep.R` and `excel_tables.R` files. Each of these files will be prefixed with `demo_` in the demo report (e.g. `demo_config.R`).

-   Get inspiration for your own HTML report by viewing examples of elements that can be included and explore the R code used to create them.

-   Learn more about digital accessibility requirements and how they influence the process of coding an HTML report.

To view the latest demo HTML report the user must first knit the `demo_report.Rmd` file. Instructions for this procedure will follow further down this document.

You can view a pre-knitted demo report here: [demo_report.html](https://datavis.nisra.gov.uk/techlab/drpvze/RAP-demo-report.html)

</details>

<details>
  <summary><strong>Skeleton template</strong></summary>

This is the basis for a user to create their own HTML report. Users can get started by loading their data and adjusting the `config.R`, `data_prep.R` and `excel_tables.R` files before knitting the `report.Rmd` file.

Users can choose to write all chapters of their report within the `report.Rmd` file or create multiple chapters using extra child `.Rmd` files. These child `.Rmd` files are then called into the `report.Rmd` file and knitted together as one HTML report.

Note that although the RAP Skeleton template only provides the main `report.Rmd` file, the RAP Skeleton demo HTML is constructed using multiple child `.Rmd` files as different chapters. Users wanting to divide different chapters into multiple child `.Rmd` files should follow the instructions found later in this documentation.

</details>

<details>
  <summary><strong>Renv</strong></summary>

#### Initialisation

`Renv` is used to lock the current version of the packages within a RAP Skeleton project so that any future users can directly recreate the results and outputs using the same renv specification. `Renv` only needs to be activated once at the start of each RAP Skeleton project and it will attempt to automatically activate when you open the project.

Upon opening the `rap-skeleton.Rproj` file for the first time you should see a message in the console similar to:

```         
# Bootstrapping renv 1.1.5 ---------------------------------------------------
- Downloading renv ... OK
- Installing renv  ... OK

- Project 'C:/.../34-rap-skeleton/rap-skeleton-dev' loaded. [renv 1.1.5]
- One or more packages recorded in the lockfile are not installed.
- Use `renv::status()` for more details.
```

Next open the `renv_setup.R` script and follow the steps within titled `renv::restore()` and `renv::status()`. If successful, renv should now be activated and all required packages should be available.

When setting up renv within this project, you may see error lines printed to console similar to:

```         
renv was unable to query available packages from the following repositories: 
- # file:////pr-clus-vfpdfp/DOF_NISRA_R_Packages/production/src/contrib --------
```

These do not affect the setup of the project and can be ignored

#### Help & Troubleshooting

If the above steps do not appear to work or error messages appear, read more about troubleshooting renv in our [R Documentation](https://datavis.nisra.gov.uk/techlab/drpvze/r.html#renv_troubleshooting)

For further information on this package, visit the [Renv website.](https://rstudio.github.io/renv/index.html)

#### Continuing development within Renv

This version of the RAP Skeleton points to an internal Tech Lab repository of packages called the TLCRAN, which is called upon in the above setup. However if you need to develop further with your project, and add new packages, follow the instructions under the title `renv::install() and renv::snapshot()` in the `renv_setup.R` script.

#### Git and renv

Renv projects work best with git integration as they are built upon the idea that all users will be working from a local copy of the code base. If you are not using git, you cannot work from a shared copy of the code on a shared drive, for example, as only one local user can be configured at one time on a renv project.

To allow renv to work without git, you will need individual local copies of the code for each user and one central shared copy that is updated as the project develops. Any changes to the central code will need to be manually copied to local users periodically.

</details>

<details>
  <summary><strong>Using the RAP Skeleton</strong></summary>

After downloading the RAP Skeleton project, understanding the folder structure and activating `Renv` users can either:

-   Knit the demo HTML report.

or

-   Create an HTML report with the RAP Skeleton template.

It is recommended that first-time users of the RAP Skeleton knit the demo report. This will allow the user to view and interact with an HTML report and give them an idea of what their own report could look like and what elements they can consider including.

<summary><strong>Knitting the Demo</strong></summary>

Knitting the `demo_report.Rmd` file will produce the demo HTML report. Follow these steps to produce the demo HTML report:

-   Open the `demo_report.Rmd` file by selecting it under the `Files` tab in the bottom right quadrant of R Studio (`code/demo/demo_report.Rmd`).

-   Press ‘knit’ at the top of the `demo_report.Rmd` window (or Ctrl+Shift+K).

After several seconds, the demo HTML report should appear within your R Studio screen. It will also be saved in the `demo_outputs` folder (`code/demo/demo_outputs/`).

  <summary><strong>Creating an HTML report with the RAP Skeleton template</strong></summary>

Before creating an HTML report with the RAP Skeleton template, users should familiarise themselves with the files and folders associated with RAP Skeleton. There is not a set workflow for using the RAP Skeleton, however, the following steps are an example workflow that could be suitable for many reports:

-   Rename these files and folders to something appropriate E.g. the name of your publication:

    -   `rap-skeleton-x.x` (main folder)

    -   `rap-skeleton.Rproj` (R project file)

-   Insert raw data files into the `data` folder (if your code is not stored on GitHub). Otherwise, connect to external data eg. on a shared drive or SQL server, you can specify that in config.R

-   Open the `.Rproj` file (previously named `rap-skeleton.Rproj`). This will open the project within R Studio.

-   Open the `config.R` file to edit publication metadata. Set the following variables:

    -   `nics_theme` - Select appropriate department. Can be any of "teo", "daera", "dfc", "de", "dfe", "dof", "dfi", "doh", "doj", "bso". Based on the selection made the appropriate department branding and logos will be applied.

    -   `prerelease` (default = FALSE) - If set to "TRUE" the pre-release warning messages will display.

    -   `bilingual` (default = TRUE) - Default setting of "TRUE" will cause NISRA logo to display both English and Irish. Set to "FALSE" if not required.

    -   `current_year`

    -   `title`

    -   `subtitle`

    -   `statistic_type`

    -   `pub_date`

    -   `next_pub_date`

    -   `header_publisher`

    -   `lead_statistician`

    -   `header_telephone`

    -   `header_email`

    -   `Excel_Rounding` (default = ‘Yes’)

-   Open the `data_prep.R` file.

    -   Read in your data (view example code for reading in .csv, .xlsx, .sav files and SQL data.)

    -   Process your data and create data frames.

-   Open the `report.Rmd` file and edit the following:

    -   `title` in the YAML

-   Write the contents of your report within the `report.Rmd` file and any associated child `.Rmd` files that are called into the `report.Rmd` file.

-   Knit the `report.Rmd` file to create the HTML report.

-   Open the `excel_tables.R` file if your report requires accompanying Excel tables.

    -   Create and format Excel workbooks (further instructions below).

-   Review HTML and Excel outputs in the `outputs` folder.

Refer to the Dissemination branch advice on [accessibility](https://nicsonline.sharepoint.com/sites/TM-DOF-NISRATEAM/SitePages/DISSEMINATION%20Accessibility.aspx?csf=1&web=1&share=ERUVgIGLxlZHrhT2Qx2TYNwBR9Wz9sVOdzU6s5szFWfKsA&e=pLQycg&CID=8717807a-fbf7-4382-addd-b996ed43e60c) and publishing via the [Datavis server](https://nicsonline.sharepoint.com/sites/TM-DOF-NISRATEAM/SitePages/DISSEMINATION%20Datavis.aspx?csf=1&web=1&share=EReyP93ozeFEozbNJWq3P_kBHxQDUBduy8sGFc335Sx3OA&e=QKW2re&CID=b3035e06-e924-4a4d-b53e-6d44cc99d466).

</details>

<details>
  <summary><strong>Implementing child .Rmd files as individual chapters</strong></summary>

As stated previously, the whole report can be written within the ‘report.Rmd’ file or spread across multiple chapters by using child .Rmd files that are then called into the ‘report.Rmd’ file. If you wish to use child .Rmd files for creating chapters then follow these steps:

-   Using Windows file explorer, copy one of the child .Rmd files (e.g. 02_introduction.Rmd) from the ‘demo’ folder into the same folder that contains your main ‘report.Rmd’ file.

-   Rename the file to something appropriate.

-   Open the child .Rmd file within your R project and edit the title in the YAML.

-   Make any other adjustments to the YAML that may be needed e.g set the ‘output_dir’ to the required output destination.

-   Edit the set-up chunk to ensure that the correct ‘config.R’, and ‘data_prep.R’ files are sourced along with any other requirements.

-   Edit the contents of the chapter beneath the set-up chunk.

-   Save the changes to your child .Rmd file and open the ‘report.Rmd’ file which will call in the child .Rmd file.

-   To read the child .Rmd file into the ‘report.Rmd’ file follow these steps:

    -   Create an h2 level header as a chapter title.

    -   Create an R code chunk.

    -   Insert a description for this R code chunk e.g. introduction_sub_report.

    -   Call in the child .Rmd file e.g. child= ‘02_introduction.Rmd’

    -   Knit the `report.Rmd` and check output.

Example:

![](data/images/child.png)

</details>

<details>
  <summary><strong>Creating Excel tables</strong></summary>

The RAP Skeleton R project contains an R script called ‘excel_tables.R’ which can be used to create accompanying Excel workbooks for your HTML report. Once created, these Excel files are saved in the ‘outputs’ folder. Alongside this, we reccommend referring to the demo folder and the file `demo_excel_tables_new.R` as a worked example of how to utilise the `f_worksheet.R` function to create excel outputs.

Creating Excel files involves the following steps within the ‘excel_tables.R’ file:

-   Configure the workbook metadata, update these fields to match your publication, for example:

    - `title` – full publication title (appears in Excel properties).
    - `subject` – a short subject line.
    - `category` – broad category (e.g. “Population”, “Labour Market”, etc.).
    - `creator` - branch/team name.

-   Update the Introduction sheet text:

    - Line 1 – publication title.
    - Line 2 – short description (what the tables contain).
    - `pub_date_words_dmy` – defined in `config.R`; sets it to your publication date in words.
    - Contact block – replace “Joe Bloggs…” with your real contact name, team, address, phone and email.
    - ⚠️ Leave the lines `"PUBLICATION LINK"` and `"BQR LINK"` in place – these are placeholders used to position the hyperlinks.

-   Update publication and BQR links:
    - `pub_link` to the URL of your **published report**.
    - `names(pub_link)` to the text you want to appear for that link.
    - `bqr_link` to the URL of your **Background Quality Report** (or equivalent).
    - `names(bqr_link)` to the text you want to appear for that link.
    - You must keep `class(... ) <- "hyperlink"` so Excel recognises these as hyperlinks.

-   Contents sheet:
    - Edit the first line to match your publication title.
    - `cr <- 3` is a **row counter** used by `f_worksheet()` to add entries to the contents sheet automatically. In general you should leave cr as 3.

-   Use `f_worksheet()` to add sheets. You can copy one of the provided examples, uncomment it, and edit the placeholders or refer to `demo_excel_tables_new.R` for a worked example.

-   For tables with multiple sub-tables (e.g. 3a and 3b), use the “Table 3 example” block and point data at each data frame.

-   Set the output file location and save your workbook to the desired location:
    - Update the path and filename to wherever you want the Excel file to be saved.


-   It is recommended to view and run the `demo_excel_tables_new.R` (if using f_worksheet function) or `demo_excel_tables.R` (if using f_single_excel function) file for further information creating accompanying Excel tables.

</details>

<details>
  <summary><strong>Storing your R project in a Github repository</strong></summary>

It is recommended that you store the R project for your HTML report in a Github repository. This safeguards your code and allows you to revert to previous versions if required. It also allows other contributors to easily access and update the project code.

#### Git prerequisites

Before attempting to store your R project on Github you must first:

-   Ensure your R project folder is named something appropriate (e.g. `01-doj-newpublication`) and is no longer called `rap-skeleton-x.x`.

-   Install 'Git for Windows' on your computer from the IT Assist Store (remembering to install this on all new staff machines and when changing to new machines).

-   Open a Github account online using your work email address.

-   Ensure You have run the following configuration codes in the terminal of R Studio, remembering to insert your Github user name and associated email address in the second and third lines:

```         
git config --global http.sslVerify false
git config --global user.name "YourUsername"
git config --global user.email firstname.lastname@nisra.gov.uk
```

#### Create your repository on Github and upload your project

A Github repository must be created first before you can 'push' the contents of your R project up to the repository.

Once the 'Git prerequisites' are completed then follow these steps to create a repository and link your R project:

-   In Github.com, create a new repository
    -   Name the repository the same name as your R project folder e.g. `01-doj-newpublication`
    -   Set repo to private.
    -   Do not `Add a README file`.
    -   Select `Create repository`.
-   Copy the following code, making sure to edit the URL on the fifth line to include the URL of your Github repository:

```         
git init          
git add .         
git commit -m "initial upload"          
git branch -M main                 
git remote add origin https://github.com/your-organisation/name-of-your-repo.git          
git push -u origin main         
```

-   Paste this code into the terminal in R studio when you have the R project open and press enter.

-   A popup may appear and ask you to sign into Github with your browser. If you get an error try running: `git push -u origin main`

-   Refresh your repo on github.com again and you should see all the contents of your R project has now been pushed up to the repo.

-   Close your R studio project and re-open again. You should now see a ‘Git’ tab on the top right quadrant of the screen.

#### Connecting to an existing Github repository

##### Cloning a repo

If your team has an existing repository you'd like to connect to you'll have to make sure you've followed the steps in the `Git prerequisites` section above. In addition you'll have to make sure that a member of your team with admin rights to the project has added you as a collaborator on the Github repository.

Then, in R Studio, Click File \> New Project \> Version Control \> Git and paste the desired repository's URL in. Save your local clone of the Git repository somewhere locally on your machine, either on your Desktop or Documents folder.

To revisit the Project after closing RStudio, double click on the .Rproj file contained in the Project folder.

NOTE: You cannot connect to the RAP skeleton in this way, this is only for projects within your team.

</details>

<details>
  <summary><strong>Tidyverse style guide</strong></summary>

Tidyverse is a style guide used to improve consistency and readability of R code. There are two R packages which support this style guide:

-   [styler](https://styler.r-lib.org/) allows you to interactively restyle selected text, files, or entire projects. It includes an RStudio add-in, the easiest way to re-style existing code.

-   [lintr](https://github.com/r-lib/lintr) performs automated checks to confirm that you conform to the style guide.

Both packages have been added to the renv lockfile and library calls in the config.R script. They are now incorportated into the RAP skeleton and can be used as described below.

-   Styler can be used to automatically reformat your file to Tidyverse format by clicking the addins dropdown below the toolbar in R studio and by selecting the option 'style active file'.

-   Not all formatting issues can be fixed by styler such as line length violations and lengthy variable names.

-   Before committing code to GitHub, paste the following command into your console in R studio to check for any formatting violations in the code before pushing any changes to the source repository.

```         
lintr::lint_dir()
```

-   A list of warnings should appear with the file name and line location where there is a violation to the TidyVerse formatting.

-   It is important to run lintr after using styler as not all of the code issues are automatically fixed by styler.

</details>

<details>
  <summary><strong>HTML Meta Tags for Search Engine Optimisation (SEO)</strong></summary>

- Meta tags can be found in the meta.html file and are labels that help share data with search engines of what webpages are about. Ensure that the description and keywords in the meta.html file are tailored to the specific report that is being written e.g. hospital waiting lists, department of education.

</details>

<details>
  <summary><strong>Accessibility & Best Practices</strong></summary>

Accessibility tips (such as screen reader-friendly alt text, colour contrast) are applied throughout.

- Follow H1 \> H2 \> H3 structure without skipping levels

- Use descriptive alt text for all images and infographics - even decorative images should be marked with empty alt text. Do not use redundant phrases like "image of..."

- Prefer PNG images to SVG or other formats
  
- Avoid using headings purely for styling

- Do not use bold text for headings; use heading styles instead. Bold text is for emphasis, and should be clearly marked up with the HTML tag <strong>strong</strong> or <em>em</em>

- Prefer colour palettes with high contrast and screen-reader compatibility

- Ensure any links have descriptive text, indicating where the link will take the user when clicked. e.g: The [NISRA Accessibility Statement](https://datavis.nisra.gov.uk/dissemination/accessibility-statement-visualisations.html) is now included as a link in the footer of the RAP Skeleton.

- Do not use images of text; use real text and style as appropriate

- Where a layout other than report format has been used, ensure reading order is always left-to-right

- Landmark areas must be identified by using <div> tags. The document must have <main> at minimum but ideally have <header>, <nav> or <footer> too if applicable. See the `demo_report.Rmd` for examples.

- An accessibility contact should be added to all reports. refer to the bottom of `demo_report.Rmd` for an example.

#### Image requirements for accessibility

All images in HTML outputs should have descriptive `alt` text to support accessibility.

-   If an image is decorative, alt text can be set to an empty string: `alt=""`.
-   <strong><em>Never</em></strong> include phrases like `"Image of"` in alt text. For example, use `alt="Joe Bloggs"` not `alt="Image of Joe Bloggs"`.
-   For other images, provide a short description of what the image shows.

For a decorative .svg image:

``` html
<img src="..images/decorative.svg" alt="">
```

For an informative .png image:

``` html
<img src="..images/nisra-logo.png" alt="NISRA logo">
```

Important note: There are issues with SVG images currently where screen readers cannot read the text on the images properly. It is important that all text is clear on these images and are properly tested for accessibility. If there are still issues with the screen reader reading text within an SVG image, it is recommended to use a PNG image format instead.

</details>

<details>
  <summary><strong>Updating to V3 from RAP Skeleton V2</strong></summary>

The file structure of RAP Skeleton V3 is almost identical to V2 and works in a similar fashion. It is recommended that any reports created using V2 are now updated to RAP Skeleton V3. You should copy your content out of your V2 report and put it into V3 rather than try to pull the additional features from V3 into V2. 

This guide explains how to update an existing project so it uses the latest version of the shared RAP Skeleton.
You will:

- Download the updated RAP Skeleton

- Move your project-specific code into the updated template.

- Replace the contents of your existing Git project with the updated template excecpt the `.git` and `.Rproj.user` (if present) files.

- Restore packages and commit the updated code.

### 1. Before You Start

**1. If storing your code on GitHub Commit and push all current changes**

  - Open your project in RStudio.
  - Commit all outstanding changes.
  - Push to your remote.
  - (Recommended) Create a new branch, e.g. rap-skeleton-update-2025.

**2. Close RStudio** before moving files.

**3. Identify your Git-connected project folder**

  - This is the folder that contains the .git directory (and usually a .Rproj file).]

**⚠️ In your file explorer ensure you have hidden items visible.**
  - To check this, navigate to "File Explorer > Options > View > Hidden files and folders" and ensure this is set to "Show hidden folders, files, or drives". 

### 2. Download the Updated RAP Skeleton

  1. Go to the RAP Skeleton repository on GitHub.
  2. Download the latest version as a **ZIP file** (via **Code** → **Download ZIP** or via the latest release).
  3. Extract the ZIP to a separate location on your machine (e.g. `C:/Users/.../rap-skeleton-3.0/`).

This extracted folder is referred to as `rap-skeleton-3.0` in later steps.

### 3. Move Your Project-Specific Code into the Updated RAP Skeleton

Inside `rap-skeleton-3.0`, edit and add back any files or scripts that belong to your project, including:

-   Edit the `config.R` file to set all required variables.

-   If your report requires any additional packages then ensure they are added to the package list in the `config.R` file using the `library` function. Also follow these two additional steps in the R Studio console:

    -   Run `renv::snapshot()` to update the renv lockfile with your additional packages.
    -   Run `renv::restore()` to install any of these additional packages.

-   Copy any additional functions that you may have created into the `functions` folder.

-   Copy any images needed into the `images` folder.

-   Copy all data loading and data prep code into the `data_prep.R` file. Note - data_prep no longer uses paste0() in setting up the config.R file path . It now uses the here() package to build the full path by passing "code/config.R" as a relative path. here() automatically resolves paths relative to the project root (where your .Rproj or root marker is).

-   Copy across the content of the report into the `report.Rmd` file. If the previous report was created using child `.Rmd` files then copy these files into the correct project folder and ensure they are read in correctly in the new V3 `report.Rmd` file.

By the end, `rap-skeleton-3.0` should contain:

  - All updated template files, **plus**
  - Your project-specific files layered on top.

### 4. If storing your code on GitHub Replace Your Existing Git Project with the RAP Skeleton

Let your existing Git project folder be called `YOUR_PROJECT`.

1. Ensure RStudio is closed.
2. Navigate to the `YOUR_PROJECT` folder.
3. **Delete everything except the following:**

  - `.git`
  - `.Rproj.user` (if present)

**⚠️ Make sure you are deleting files inside the correct folder.
The folder must contain** `.git.`

4. Open the `rap-skeleton-3.0` folder.
5. **Copy all files and folders from `YOUR_PROJECT` into `rap-skeleton-3.0`**.

  - Include the new `.Rproj file`, updated `renv.lock`, scripts, folders, and your project-specific additions.
  - Rename the copied `.Rproj file` file to match the name of `YOUR_PROJECT`.

Your Git repository now contains the updated template with your project integrated.

### 5. Open the Project and Restore Packages

1. Open the project by double-clicking the new `.Rproj` file inside `YOUR_PROJECT`.
2. Ensure you are using the appropriate updated **R version**. (R version 4.4.3)
3. Run the following in the console:

    - `renv::restore()`

4. Test the project to ensure everything runs correctly:
  - Source key scripts
  - Run your workflows
  - Confirm packages installed correctly

### 6. If storing your code on GitHub Commit and Push the Updated RAP Skeleton

1. Open the **Git pane** in RStudio (or use command line).
2. Review the added/modified files.
3. Stage everything:

    - Run this command in your Terminal in RStudio `git add -A`.
      **Or**
    - Manually stage changes in your Git pane

4. Commit with a clear message, e.g.:

    -  Run this command in your Terminal in RStudio `git commit -m "Update project to latest R template (new R version, updated renv.lock, template improvements)"`
       **Or**
    - Manually commit your changes through the button in RStudio.

5. Push to your remote:

    - Run this command in your Terminal in RStudio `git push`
      **Or**
    - Manually push your changes through the button in RStudio.

6. If using a branch, open a pull/merge request.

Once all the above steps have been completed you will have the updated RAP skeleton incorporated in your exisiting project and it should run as normal.

</details>

<details>
  <summary><strong>Updating from the Accessibility Template Exemplar</strong></summary>

The previously released Accessibility Template Exemplar has now been superseded by the RAP Skeleton. It is recommended that any reports using the the Accessibility Exemplar as a template are now updated to the RAP Skeleton. Follow the above instructions (Create an HTML report with the RAP Skeleton template) but also take note of these additional points:

-   Edit the `config.R` file to set all required variables.

-   If your report requires any additional packages then ensure they are added to the package list in the `config.R` file using the `library` function. Also follow these two additional steps in the R Studio console:

    -   Run `renv::snapshot()` to update the renv lockfile with your additional packages.
    -   Run `renv::restore()` to install any of these additional packages.

-   Copy any additional functions that you may have created into the `functions` folder.

-   Note that the `header` and `footer` sections in the RAP Skeleton are now created using functions. This content is set via the `config.R` file – there is no need to copy the header HTML code from the Accessibility Template Exemplar into the RAP Skeleton.

-   The HTML code at the bottom of the Accessibility Template Exemplar creates download buttons, borders, page banners, the pre-release paragraph and the `tabOrder` function. The RAP Skeleton has these elements already built-in, therefore, this HTML code does not need to be copied into the RAP Skeleton.

-   Copy all data loading and data prep code into the `data_prep.R` file. Bear in mind this no longer has to be written in chunks as in the Accessibility Template Exemplar.

-   Copy across the content of the report into the `report.Rmd` file or modularise the report by implementing chapters with child .Rmd files.

If you would like to store your project in GitHub, please refer to the **Storing your R project in a Github repository** above.

</details>

<details>
  <summary><strong>How to use new f_worksheet.R Function</strong></summary>

The new **`f_worksheet()`** function streamlines the creation of Excel outputs by automating much of the formatting and setup work that was previously coded manually. An example of how the new `f_worksheet.R` function can be used is shown in  `code/demo/demo_excel_tables_new.R`.

This guide explains the key differences, what the new workflow looks like, and how to update your existing scripts.

---

#### Overview of What’s Changed

| Feature | Old Workflow | New Workflow (`f_worksheet()`) |
|----------|---------------|--------------------------------|
| **Workbook creation** | Manually create and populate each worksheet | Workbook still created manually once, but worksheets are now built using a single function call |
| **Formatting** | Fonts, column widths, row heights, and heading styles manually defined | All formatting handled internally by `f_worksheet()` |
| **Contents page** | Hand-coded hyperlinks to each table sheet | Automatically updated when `f_worksheet()` is used |
| **Multiple tables per sheet** | Manually written with `writeDataTable()` for each table | Pass a list of tables (each with data, title, and notes) to `f_worksheet()` |
| **Notes handling** | Manually written and formatted | Automatically added within the same worksheet or at the bottom of multi-table sheets |
| **Reusability** | Long, repetitive code | Short, modular, reusable calls |

---

#### Step-by-Step Migration

##### 1. Load and Prepare Data

This part stays the same — your data preparation script still gets sourced first.

```r
library(here)
source(here("code/demo/demo_data_prep.R"))
```
##### 2. Create the Workbook

Old:
```r
new_workbook <- createWorkbook(creator = "Tech Lab", title = "Demonstration tables")
```

New:
```r
wb <- createWorkbook(
  creator = "NISRA Tech Lab",
  title = "Mid-year population statistics for Northern Ireland 2022",
  subject = "Mid-year population statistics for Northern Ireland",
  category = "Population"
)
```
Then apply base formatting (unchanged):

``` r
modifyBaseFont(wb, fontSize = 12, fontName = "Arial")
```

##### 3. Add the Introduction Sheet

Replace your old “Cover sheet” code block with the new, simpler “Introduction” section:

```r
addWorksheet(wb, sheetName = "Introduction")

intro_text <- c(
  "Mid-year population statistics for Northern Ireland 2022",
  "The following tables contain population and demography statistics for Northern Ireland...",
  "Linked report (and infographics):",
  "PUBLICATION LINK",
  pub_date_words_dmy,
  "Quality Information:",
  "BQR LINK",
  "Contact Information:",
  "Joe Bloggs\nTechnology and Support Lab, NISRA\nColby House\nStranmillis Court\nBelfast, BT9 5RR\n\nTelephone: 028 1234 5678\nE-mail: techlab@nisra.gov.uk"
)

writeData(wb, "Introduction", x = intro_text)
```
✅ Tip: Hyperlinks, heading styles, and layout are now handled automatically — just replace placeholder text like "PUBLICATION LINK" and "BQR LINK" with your URLs and display text.

##### 4. Add the Contents Page

No need to manually define vectors of table names or hyperlinks anymore.
Now you just create a “Contents” worksheet and let `f_worksheet()` update it as you go.

```r
addWorksheet(wb, sheetName = "Contents")

writeData(wb, "Contents",
          x = c(
            "Mid-year population statistics for Northern Ireland 2022",
            "Table of Contents"
          ))
```
The counter `cr` (row tracker) is maintained automatically inside `f_worksheet()`.

##### 5. Create Data Tables with `f_worksheet()`

Each worksheet is now added with a single function call.

###### Example: One table per worksheet
```r
f_worksheet(
  wb,
  sheet_name = "Table_1",
  contents   = "Table 1: Northern Ireland mid-year population estimates by age group and sex, 2022",
  title      = "Table 1: Northern Ireland mid-year population estimates by age group and sex, 2022",
  outlining  = "outlining mid-year population estimates by age group and sex",
  tables = list(
    list(
      data  = df_t1_ss,
      title = "Table 1: Northern Ireland mid-year population estimates by age group and sex, 2022",
      note  = "Notes: The estimates are produced using a variety of data sources and statistical models"
    )
  )
)
```

###### Example: Multiple tables on one sheet

If a sheet contains multiple tables, simply include multiple list items:

```r
f_worksheet(
  wb,
  sheet_name = "Table_3",
  contents   = "Table 3: Population of under 25s and over 65s by LGD 2022",
  title      = "Table 3: Population of under 25s and over 65s by LGD 2022",
  outlining  = "outlining mid-year estimates of population aged under 25s and over 65 by LGD",
  tables = list(
    list(
      data  = df_t3a_ss,
      title = "Table 3a: Population of young people by LGD in NI 2022",
      note  = c(
        "Notes:",
        "The estimates are produced using a variety of data sources and statistical models",
        "Population aged under 25 on survey date",
        "Youthrate is percentage of under 25s rounded to 1 decimal place"
      )
    ),
    list(
      data  = df_t3b_ss,
      title = "Table 3b: Population of elderly people by LGD in NI",
      note  = "Notes: The estimates are produced using a variety of data sources and statistical models"
    )
  )
)
```
##### 6. Save the Workbook

Saving works exactly as before:

```r
xl_filename <- paste0(here(), "/code/demo/demo_outputs/RAP_demo_tables_new.xlsx")
saveWorkbook(wb, xl_filename, overwrite = TRUE)
```
##### Key Benefits of `f_worksheet()`

✅ Automatic Contents Updates: Hyperlinks and table listings are dynamically added.  
✅ Consistent Formatting: Styles (`pt`, `pt2`, `tw`, etc.) are applied internally.  
✅ Simpler Maintenance: Adding a new table is now one short function call.  
✅ Fewer Hardcoded References: No manual cell positions or style calls needed.  
✅ Supports Multi-Table Sheets: Handles spacing, headings, and notes automatically.  

</details>
