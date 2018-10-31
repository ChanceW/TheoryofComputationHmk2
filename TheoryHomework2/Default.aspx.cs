using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TheoryHomework2
{
    public partial class Default : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (IsPostBack)
            {
                //PDA palidrome
                var state1 = new State() { Id = 1, Name = "Q0", IsAcceptance = false };
                var state2 = new State() { Id = 2, Name = "Q1", IsAcceptance = true };
                state1.Transitions.Add('0', state1.Id);
                state1.Transitions.Add('1', state1.Id);
                state2.Transitions.Add('0', state2.Id);
                state2.Transitions.Add('1', state2.Id);
                state1.StackTransitions.Add('0', new KeyValuePair<char, char>(' ', '0'));
                state1.StackTransitions.Add('1', new KeyValuePair<char, char>(' ', '1'));
                state2.StackTransitions.Add('0', new KeyValuePair<char, char>('0', ' '));
                state2.StackTransitions.Add('1', new KeyValuePair<char, char>('1', ' '));
                var pda = new Machine();
                pda.States.Add(state1.Id, state1);
                pda.States.Add(state2.Id, state2);
                var text = pdaText.Text;
                var halfIndex = text.Length / 2;
                if (text.Length > 1 && text.Length % 2 != 0)
                {
                    text = text.Remove(halfIndex, 1);
                }
                text = text.Insert(halfIndex, "S");
                var pdaResults = pda.ProcessString(text);
                pdaPanel.Attributes["value"] = String.Join(":", pdaResults.Select(x => x.Name));
                pdaPanel.Attributes["stackisempty"] = $"{!pda.MachineStatck.Any()}";
                pdaPanel.Attributes["isaccepted"] = $"{pdaResults.Last().IsAcceptance}";

                //PDA a^n b^b
                var state3 = new State() { Id = 1, Name = "Q0", IsAcceptance = false};
                var state4 = new State() { Id = 2, Name = "Q1", IsAcceptance = true};
                state3.Transitions.Add('0', state3.Id);
                state3.Transitions.Add('1', state4.Id);
                state4.Transitions.Add('1', state4.Id);
                state3.StackTransitions.Add('0', new KeyValuePair<char, char>(' ','0'));
                state3.StackTransitions.Add('1', new KeyValuePair<char, char>('0', ' '));
                state4.StackTransitions.Add('1', new KeyValuePair<char, char>('0', ' '));
                var pda2 = new Machine();
                pda2.States.Add(state3.Id, state3);
                pda2.States.Add(state4.Id, state4);
                var pda2Results = pda2.ProcessString(pda2Text.Text);
                pda2Panel.Attributes["value"] = String.Join(":", pda2Results.Select(x => x.Name));
                pda2Panel.Attributes["stackisempty"] = $"{!pda2.MachineStatck.Any()}";
                pda2Panel.Attributes["isaccepted"] = $"{pda2Results.Last().IsAcceptance}";


                //CFG
                var cfgResults = CFG.ProcessString(cfgText.Text);
                cfgPanel.Attributes["value"] = String.Join(":",cfgResults);
            }
        }
    }
}