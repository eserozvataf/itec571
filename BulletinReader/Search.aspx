﻿<%@ Page Title="Search" Language="C#" AutoEventWireup="true" CodeBehind="Search.aspx.cs" Inherits="BulletinReader.Search" MasterPageFile="~/Layout.Master" Async="true" %>
<%@ Import Namespace="Microsoft.AspNet.FriendlyUrls" %>
<%@ Import Namespace="BulletinReader.DataClasses" %>
<%@ Import Namespace="Resources" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="content" runat="server">
    <div class="container">
        <div class="page-header">
            <h1>Search <small><%= this.Query %></small></h1>
        </div>

        <asp:Literal ID="NotificationArea" runat="server" />

        <asp:Repeater ID="ArticleRepeater" runat="server">
            <HeaderTemplate>
                <div class="row">
            </HeaderTemplate>
            <ItemTemplate>
                <div class="col-sm-6 col-md-4">
                    <div class="thumbnail">
                        <%# this.GetArticleCover(Container.DataItem as Article) %>
                        <div class="caption">
                            <h3><%# this.Highlight((string)Eval("Title")) %></h3>
                            <p>
                                <em><%# this.Highlight((string)Eval("Review")) %></em> - by <a href="<%# FriendlyUrl.Href("~/Author", Eval("Author.Name")) %>"><%# this.Highlight((string)Eval("Author.Name"), "search-highlight-author") %></a>
                            </p>
                            <div class="pull-right">
                                <a href="<%# FriendlyUrl.Href("~/Article", Eval("Title")) %>" class="btn btn-default btn-sm" role="button">
                                    <%# this.GetPurchasedItem((Guid)Eval("ArticleId")) != null ? "Purchase" : "Read" %>
                                </a>
                            </div>
                            <div class="clearfix"></div>
                        </div>
                    </div>
                </div>
            </ItemTemplate>
            <FooterTemplate>
                </div>
            </FooterTemplate>
        </asp:Repeater>

        <ul class="pagination">
            <asp:Literal ID="ArticlePaging" runat="server" />
        </ul>
    </div>
</asp:Content>
