<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="TheoryHomework2.Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Automata Machines</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <script src="automata.js"></script>
</head>
<body>
    <center>
    <form id="form1" runat="server">
        <div class="content">
            <h3>Homework 2</h3>
            <h5>Chance, Kevin, Jinsik, Victor</h5>
            <table class="table table-bordered">
                <thead>
                    <tr>
                        <th>PDA - Palidrome</th>
                        <th>PDA - 0<sup>n</sup>1<sup>n</sup></th>
                        <th>CFG - Palidrome (S -> e|0|1|0S0|1S1)</th>
                    </tr>
                </thead>
                <tr>
                    <td><asp:Textbox class="form-control" ID="pdaText" runat="server" /></td>
                    <td><asp:Textbox class="form-control" ID="pda2Text" runat="server" /></td>
                    <td><asp:Textbox class="form-control" ID="cfgText" runat="server" /></td>
                </tr>
                <tr><td colspan="3"><button class="btn btn-primary process">Process</button><button class="btn reset">Reset</button></td></tr>
                <tr class="graphRow">
                    <td><asp:Panel class="graphPanel pda" graph="pda" ID="pdaPanel" runat="server">
						<svg height="300" width="50">
                          <line x1="0" y1="150" x2="50" y2="150" style="stroke:rgb(0,0,0);stroke-width:2" />
						  <line x1="45" y1="145" x2="50" y2="150" style="stroke:rgb(0,0,0);stroke-width:2" />
						  <line x1="45" y1="155" x2="50" y2="150" style="stroke:rgb(0,0,0);stroke-width:2" />
                        </svg>
                        <svg height="300" width="100">
                          <circle class="Q0" cx="50" cy="150" r="40" stroke="black" stroke-width="3" fill="#fff" /> 
						  <circle cx="50" cy="95" r="15" stroke="black" stroke-width="2" fill="#fff" /> 
						  <circle cx="50" cy="205" r="15" stroke="black" stroke-width="2" fill="#fff" /> 
                          <text x="43" y="155" class="small">Q0</text>
						  <text x="38" y="70" class="small">0/E/0</text>
						  <text x="38" y="240" class="small">1/E/1</text>
                        </svg>
						<svg height="300" width="50">
                          <line x1="0" y1="150" x2="50" y2="150" style="stroke:rgb(0,0,0);stroke-width:2" />
						  <line x1="45" y1="145" x2="50" y2="150" style="stroke:rgb(0,0,0);stroke-width:2" />
						  <line x1="45" y1="155" x2="50" y2="150" style="stroke:rgb(0,0,0);stroke-width:2" />
						  <text x="10" y="130" class="small">0/E/E</text>
						  <text x="10" y="145" class="small">1/E/E</text>
						  <text x="10" y="165" class="small">E/E/E</text>
                        </svg>
                        <svg height="300" width="100">
                          <circle class="Q1" cx="50" cy="150" r="40" stroke="black" stroke-width="3" fill="#fff" />
                          <circle class="accept" cx="50" cy="150" r="20" stroke="black" stroke-width="3" fill="#fff" /> 
						  <circle cx="50" cy="95" r="15" stroke="black" stroke-width="2" fill="#fff" /> 
						  <circle cx="50" cy="205" r="15" stroke="black" stroke-width="2" fill="#fff" /> 
                          <text x="43" y="155" class="small">Q1</text>
						  <text x="38" y="70" class="small">0/0/E</text>
						  <text x="38" y="240" class="small">1/1/E</text>
                        </svg>
                        <div class="path"></div>
                        <div class="stackEmpty"></div>
                        </asp:Panel>
                    </td>
                    <td><asp:Panel class="graphPanel pda2" graph="pda2" ID="pda2Panel" runat="server">
						<svg height="300" width="50">
                          <line x1="0" y1="150" x2="50" y2="150" style="stroke:rgb(0,0,0);stroke-width:2" />
						  <line x1="45" y1="145" x2="50" y2="150" style="stroke:rgb(0,0,0);stroke-width:2" />
						  <line x1="45" y1="155" x2="50" y2="150" style="stroke:rgb(0,0,0);stroke-width:2" />
                        </svg>
                        <svg height="300" width="100">
                          <circle class="Q0" cx="50" cy="150" r="40" stroke="black" stroke-width="3" fill="#fff" /> 
						  <circle cx="50" cy="95" r="15" stroke="black" stroke-width="2" fill="#fff" /> 
                          <text x="43" y="155" class="small">Q0</text>
						  <text x="38" y="70" class="small">0/E/X</text>
                        </svg>
						<svg height="300" width="50">
                          <line x1="0" y1="150" x2="50" y2="150" style="stroke:rgb(0,0,0);stroke-width:2" />
						  <line x1="45" y1="145" x2="50" y2="150" style="stroke:rgb(0,0,0);stroke-width:2" />
						  <line x1="45" y1="155" x2="50" y2="150" style="stroke:rgb(0,0,0);stroke-width:2" />
						  <text x="10" y="165" class="small">E/E/E</text>
                        </svg>
                        <svg height="300" width="100">
                          <circle class="Q1" cx="50" cy="150" r="40" stroke="black" stroke-width="3" fill="#fff" /> 
                          <circle class="accept" cx="50" cy="150" r="20" stroke="black" stroke-width="3" fill="#fff" /> 
						  <circle cx="50" cy="95" r="15" stroke="black" stroke-width="2" fill="#fff" /> 
                          <text x="43" y="155" class="small">Q1</text>
						  <text x="38" y="70" class="small">1/X/E</text>
                        </svg>
                        <div class="path"></div>
                        <div class="stackEmpty"></div>
                        </asp:Panel>
                    </td>
                    <td><asp:Panel class="graphPanel cfg" graph="cfg" ID="cfgPanel" runat="server" /></td>
                </tr>
                <tr class="buttonRow">
                    <td>
                        <button graph="pda" class="btn btn-info pda" disabled>Start</button>
                    </td>
                    <td>
                        <button graph="pda2" class="btn btn-info pda2" disabled>Start</button>

                    </td>
                    <td>
                        <button graph="cfg" class="btn btn-info cfg" disabled>Start</button>
                    </td>
                </tr>
            </table>
        </div>
    </form>
    </center>
    <style>
        .process {
            margin-right: 20px;
        }

        .btn {
                padding: 3px 3px
        }
        .btn:disabled{
            background:#ddd;
        }
        body {
            background: #ddd;
        }
        .content {
            width: 80%;
        }
        table {
            text-align: center;
            background: #fff;
        }

        .graphPanel {
            height: 320px;
            overflow-y:auto;
        }
        .graphPanel.cfg div{
            font-size: 18px;
        }
    </style>
</body>
</html>
