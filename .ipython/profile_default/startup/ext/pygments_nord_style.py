"""
MIT License

Copyright (c) 2019 Rich Lewis

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
"""
"""
https://github.com/lewisacidic/nord-pygments
"""

from pygments.style import Style
from pygments.token import (
    Keyword,
    Name,
    Comment,
    String,
    Error,
    Literal,
    Number,
    Operator,
    Generic,
    Other,
    Punctuation,
    Token,
)

nord = [
    "#2E3440",
    "#3B4252",
    "#434C5E",
    "#4C566A",
    "#D8DEE9",
    "#E5E9F0",
    "#ECEFF4",
    "#8FBCBB",
    "#88C0D0",
    "#81A1C1",
    "#5E81AC",
    "#BF616A",
    "#D08770",
    "#EBCB8B",
    "#A3BE8C",
    "#B48EAD",
]


class Nord(Style):
    default_style = ""
    styles = {
        Error: nord[11],
        Other: nord[4],
        Keyword: nord[9],
        Keyword.Constant: nord[11],
        Keyword.Declaration: nord[9],
        Keyword.Namespace: nord[9],
        Keyword.Pseudo: nord[9],
        Keyword.Reserved: nord[10],
        Keyword.Type: nord[9],
        Name: nord[4],
        Name.Attribute: nord[7],
        Name.Builtin: nord[9],
        Name.Builtin.Pseudo: nord[9],
        Name.Class: nord[7],
        Name.Constant: nord[7],
        Name.Decorator: nord[7],
        Name.Entity: nord[12],
        Name.Exception: nord[12],
        Name.Function: nord[8],
        Name.Property: nord[9],
        Name.Label: nord[8],
        Name.Namespace: nord[8],
        Name.Other: nord[8],
        Name.Tag: nord[9],
        Name.Variable: nord[4],
        Name.Variable.Class: nord[4],
        Name.Variable.Global: nord[4],
        Name.Variable.Instance: nord[4],
        Literal: nord[9],
        Literal.Date: nord[9],
        Literal.String: nord[14],
        Literal.String.Backtick: nord[14],
        Literal.String.Char: nord[14],
        Literal.String.Doc: nord[14],
        Literal.String.Double: nord[14],
        Literal.String.Escape: nord[12],
        Literal.String.Heredoc: nord[14],
        Literal.String.Interpol: nord[14],
        Literal.String.Other: nord[14],
        Literal.String.Regex: nord[13],
        Literal.String.Single: nord[14],
        Literal.String.Symbol: nord[14],
        Literal.Number: nord[15],
        Literal.Number.Float: nord[15],
        Literal.Number.Hex: nord[15],
        Literal.Number.Integer: nord[15],
        Literal.Number.Integer.Long: nord[15],
        Literal.Number.Oct: nord[15],
        Literal.Number.Hex: nord[15],
        Literal.Number.Bin: nord[15],
        Operator: nord[4],
        Operator.Word: nord[9],
        Punctuation: nord[4],
        Comment: nord[3],
        Comment.Multiline: nord[3],
        Comment.Preproc: nord[10],
        Comment.Single: nord[3],
        Comment.Special: nord[3],
        Generic: nord[4],
        Generic.Deleted: nord[13],
        Generic.Emph: "italic " + nord[4],
        Generic.Error: nord[11],
        Generic.Heading: nord[8],
        Generic.Inserted: nord[4],
        Generic.Output: nord[4],
        Generic.Prompt: nord[4],
        Generic.Strong: "bold " + nord[4],
        Generic.Subheading: nord[9],
        Generic.Traceback: nord[13],
        Generic.Lineno: nord[2],
        Token.Prompt: nord[3],
        Token.PromptNum: nord[4],
    }

    style_overrides = {
        Token.Prompt: nord[14],
        Token.PromptTime: nord[13],
        Token.PromptPath: nord[7],
        Token.PromptNum: nord[7],
        Token.PromptInsertMode: nord[6],
        Token.PromptNormalMode: nord[8],
        Token.OutPrompt: nord[11],
        Token.OutPromptNum: nord[12] + " bold",
        Token.PromptNormal: nord[6],
    }
