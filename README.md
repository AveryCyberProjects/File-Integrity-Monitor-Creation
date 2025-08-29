# Creating-A-File-Integrity-Monitor (FIM)

 ### [My YouTube Demonstration](https://youtu.be/hUxfiXvlSWc) 📺 

<h2>Description</h2>


This Project that I worked on involves coding a fully functional File Integrity Monitor (FIM) using PowerShell. This FIM is able to COLLECT A NEW BASELINE and store them in a dictionary, CONTINOUSLY MONITOR FILES with a saved Baseline stored in a specific directory, ALERT the user of any files that have been CHANGED or ADDED in the directory, and ALERT the user of any files that have been DELETED in the directory.

Below is a diagram that gives you a good idea of the proof of concept/order of events in this Lab:
<br /> <br />
<img src="https://i.imgur.com/LLCVcok.png" height="50%" width="70%" alt="Disk Sanitization Steps"/>    
<img src="https://i.imgur.com/CMcPRQc.jpeg" height="2000%" width="100%" alt=""/>


<h2>Languages and Utilities Used</h2>

- <b>PowerShell</b>
- <b>PowerShell ISE</b>
<h2>Environments Used </h2>

- <b>Windows 10</b> (21H2)
<h2>Lab Walk-Through:</h2>


This lab in particular is very code heavy. Therefore I wont be walking you step by step with a written guide on a line by line basis. I figured that everyone codes in their own unique way so its really up to you on how you want to go about it.

Once your FIM directory and respective files are created you're pretty much ready to take your own crack at the challenge. Here is how to set up that directory:

1. First we will create a folder on our Desktop titled "FIM".
2. Within that same folder, create a .txt file titled "baseline.txt"
3. In the "FIM" folder create another folder titled "Files".
4. Within the files folder create 4 .txt files, where each one is named after one letter of your choosing (I simply chose a,b,c,d).
5. To finish the set up open up PowerShell ISE and save a blank .ps1 file to your FIM folder and name it "FIM.ps1"
6. Go ahead and give it your best shot! A short video that I made running the finished script is available at the top of this GitHub repository to reference as well. Screenshots of my code itself are also below, and below that will be a tutorial video linked that I used as a guide myself just in case more help is needed.
<br /> <br /> 
<u><b>My Code part 1/2</b>
  <img src="https://i.imgur.com/5qo6Ax8.png" height="80%" width="90%" alt="Disk Sanitization Steps"/> 
<br /> <br />

<b>My Code part 2/2</b>

  <img src="https://i.imgur.com/4PiPofb.png" height="80%" width="90%" alt="Disk Sanitization Steps"/>
  <br><br/>
<br />
<b>In depth tutorial video credit given to @JoshMadakor</b>
<br><br/>
https://youtu.be/WJODYmk4ys8?si=PEexhAqpZzbY227w 📺 
