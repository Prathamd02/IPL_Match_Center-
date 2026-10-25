# 🏏 IPL Match Center
### _Building smarter cricket management with SAP CAP_

<p align="center">
  <img src="docs/images/ipl-match-center.png" alt="IPL Match Center Preview" width="100%"/>
</p>

<p align="center">
  <b>From cricket data to structured business logic.</b><br/>
  A backend development project exploring data modeling, service design, and business validations using SAP Cloud Application Programming Model.
</p>

<p align="center">
  <img src="https://img.shields.io/badge/SAP-CAP-0FA6A6?style=flat-square&logo=sap&logoColor=white"/>
  <img src="https://img.shields.io/badge/Node.js-Backend-339933?style=flat-square&logo=nodedotjs&logoColor=white"/>
  <img src="https://img.shields.io/badge/CDS-Data%20Modeling-6C5CE7?style=flat-square"/>
  <img src="https://img.shields.io/badge/OData-API%20Services-0070F2?style=flat-square"/>
</p>

---

## ✦ The Idea Behind the Project

> [!IMPORTANT]
> **The challenge isn't just managing match records — it's keeping the data consistent.**

Cricket match management involves interconnected data: teams, players, venues, fixtures, and results. Poorly enforced business rules can lead to invalid match outcomes, incorrect associations, and inconsistent records.

**IPL Match Center** addresses this challenge through a structured backend built with SAP CAP, combining data modeling with business-oriented validation.

## ✦ What I Built

| Feature | Description |
|---|---|
| 🏏 Entity Management | Teams, players, venues, and matches |
| 🔗 Data Relationships | Structured associations using CDS |
| ⚙️ CAP Services | Expose business data through OData |
| 🛡️ Business Validation | Prevent invalid operations and inconsistent data |
| 🔒 Data Integrity | Protect teams with dependent player records |

## ✦ Technology Stack

`SAP CAP` · `CDS` · `Node.js` · `OData` · `SAP Business Application Studio` · `Git`

## ✦ Under the Hood

```text
Client / API Consumer
        │
        ▼
   CAP Service Layer
        │
        ▼
 Business Logic & Validation
        │
        ▼
     CDS Data Model
        │
        ▼
      Database
```

The design separates service exposure, business rules, and data modeling, making the application easier to understand, test, and extend.

## ✦ Engineering Highlights

- **Think beyond CRUD:** Apply domain rules rather than simply accepting every request.
- **Protect data integrity:** Prevent operations that could leave dependent records inconsistent.
- **Validate at the backend:** Keep critical business rules independent of the client interface.
- **Design for extension:** Build a foundation for future SAP Fiori integration and SAP BTP deployment.

## ✦ What I'm Learning

This project is part of my hands-on journey into SAP application development, with a focus on understanding how enterprise applications manage relationships, validate operations, and expose reliable business services.

> **My engineering principle:** A successful API request is good. A system that prevents invalid data in the first place is better.

## ✦ What's Next?

- [ ] Add automated tests for business rules.
- [ ] Develop a SAP Fiori Elements interface.
- [ ] Implement role-based authorization.
- [ ] Deploy the application to SAP BTP.

---

<p align="center">
  <b>Designed with logic. Built with purpose. Improved through practice.</b>
  <br/><br/>
  <i>Developed by Pratham Desai | SAP Application Development</i>
</p>
