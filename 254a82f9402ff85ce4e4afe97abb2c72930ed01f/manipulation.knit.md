---
title: "Data manipulation"
---



<div class="layout-chunk" data-layout="l-body">
`<a href="data:text/x-markdown;base64,LS0tDQp0aXRsZTogIkRhdGEgbWFuaXB1bGF0aW9uIg0KLS0tDQoNCmBgYHtyIGV2YWwgPSBUUlVFLCAgbWVzc2FnZT1GLCBpbmNsdWRlPUYsIHdhcm5pbmc9RiwgcHVybD1GLCByZXN1bHRzPSJoaWRlIn0NCmtuaXRyOjpwdXJsKCdtYW5pcHVsYXRpb24uUm1kJywgZG9jdW1lbnRhdGlvbiA9IEYpDQpgYGANCg0KYGBge3IgZWNobz1GQUxTRSwgcHVybD1GfQ0KeGZ1bjo6ZW1iZWRfZmlsZSgnbWFuaXB1bGF0aW9uLlJtZCcpDQpgYGANCg0KYGBge3IgZWNobz1GQUxTRSwgcHVybD1GfQ0KeGZ1bjo6ZW1iZWRfZmlsZSgnbWFuaXB1bGF0aW9uLlInKQ0KYGBgDQoNCkRhdGEgbWFuaXB1bGF0aW9uIGludm9sdmVzIG1vZGlmeWluZyBkYXRhIHRvIG1ha2UgaXQgZWFzaWVyIHRvIHJlYWQgYW5kIHRvIGJlIG1vcmUgb3JnYW5pemVkLiBXZSBtYW5pcHVsYXRlIGRhdGEgZm9yIHZpc3VhbGl6YXRpb24gYW5kIGFuYWx5c2lzLiBJdCBpcyBhbHNvIHVzZWQgYW5kIGNvbWJpbmVkIHdpdGggdGhlIHRlcm0g4oCYZGF0YSBleHBsb3JhdGlvbuKAmSB3aGljaCBpbnZvbHZlcyBvcmdhbml6aW5nIGRhdGEgdXNpbmcgYXZhaWxhYmxlIHNldHMgb2YgdmFyaWFibGVzLiBBdCB0aW1lcywgdGhlIGRhdGEgY29sbGVjdGlvbiBwcm9jZXNzIGRvbmUgYnkgbWFjaGluZXMgaW52b2x2ZXMgYSBsb3Qgb2YgZXJyb3JzIGFuZCBpbmFjY3VyYWNpZXMgaW4gcmVhZGluZy4gRGF0YSBtYW5pcHVsYXRpb24gaXMgYWxzbyB1c2VkIHRvIHJlbW92ZSB0aGVzZSBpbmFjY3VyYWNpZXMgYW5kIG1ha2UgZGF0YSBtb3JlIGFjY3VyYXRlIGFuZCBwcmVjaXNlLg0KDQojIERhdGFzZXQNCg0KVGhlIHBhY2thZ2UgYGRhdGFzZXRzYCBwcm92aWRlcyBkYXRhc2V0cy4gSXQgaXMgcGFydCBvZiB0aGUgQmFzZSBSIGRhdGFzZXRzIGFuZCB1c2VkIGluIG1hbnkgZXhhbXBsZXMgaW4gdGhlIFIgaGVscC4gQW1vbmcgdGhvc2UgZGF0YSBzZXRzLCBgaXJpc2AgKGA/aXJpc2ApIGdpdmVzIHRoZSBtZWFzdXJlbWVudHMgaW4gY2VudGltZXRlcnMgb2YgdGhlIHZhcmlhYmxlcyBzZXBhbCBsZW5ndGggYW5kIHdpZHRoIGFuZCBwZXRhbCBsZW5ndGggYW5kIHdpZHRoLCByZXNwZWN0aXZlbHksIGZvciA1MCBmbG93ZXJzIGZyb20gZWFjaCBvZiAzIHNwZWNpZXMgb2YgaXJpcy4gVGhlIHNwZWNpZXMgYXJlICpJcmlzIHNldG9zYSosICp2ZXJzaWNvbG9yKiwgYW5kICp2aXJnaW5pY2EqLiAgICANCg0KYGBge3IsICBldmFsPVR9DQpsaWJyYXJ5IChkYXRhc2V0cykgIyBsb2FkIHBhY2thZ2UNCnJtKGxpc3Q9bHMoKSkgIyBjbGVhbiBtZW1vcnkNCmRhdGEoaXJpcykgIyBpbXBvcnQgZGF0YXNldA0KaGVhZCAoaXJpcykgIyB2aXN1YWxpemUgJ2hlYWQnIGRhdGFzZXQNCiMgbm90ZSB0aGF0IHVzaW5nIGRhdGEgYXV0b21hdGljYWxseSBjcmVhdGUgYW4gb2JqZWN0IGNhbGxlZCAnaXJpcycNCmBgYA0KDQpTdW1tYXJpemUgdGhpcyBkYXRhc2V0OiANCg0KYGBge3IsICBldmFsPVR9DQpzdW1tYXJ5KGlyaXMpICMgIG9iamVjdCBzdW1tYXJ5DQpgYGANCg0KWW91IGNhbiBleGFtaW5lIHRoZSBgY2xhc3NgICh0eXBlKSBvZiB0aGUgb2JqZWN0IHlvdSBhcmUgbWFuaXB1bGF0aW5nLiBFeGFtaW5pbmcgaXRzIHN0cnVjdHVyZSBgc3RyYCBpcyBlc3NlbnRpYWwgdG8gdW5kZXJzdGFuZCB0aGUgdmFyaWFibGVzIHlvdSBoYXZlLg0KDQpgYGB7ciwgIGV2YWw9VH0NCnN0cihpcmlzKSAjIGV4YW1pbmUgdGhlIHN0cnVjdHVyZSBvZiB0aGUgb2JqZWN0DQpgYGANCg0KVGhlIG9iamVjdCBgaXJpc2AgaXMgYSBgZGF0YS5mcmFtZWAgYW5kIGlzIGNvbXBvc2VkIG9mIDUgdmFyaWFibGVzIChgU2VwYWwuTGVuZ3RoYCwgYFNlcGFsLldpZHRoYCwgYFBldGFsLkxlbmd0aGAsIGBQZXRhbC5XaWR0aGApIGFuZCAxNTAgb2JzZXJ2YXRpb25zLiBGb3VyIHZhcmlhYmxlcyBhcmUgbnVtZXJpYywgb25lIGlzIGEgZmFjdG9yIHdpdGggMyBsZXZlbHMgKGBTcGVjaWVzYCkuIE90aGVyIG9iamVjdCB0eXBlcyBhbmQgc3RydWN0dXJlcyBhbHNvIGV4aXN0OiBkYXRhIGZyYW1lLCAgZmFjdG9yLCBpbnRlZ2VyLCBtYXRyaXgsIGV0Yy4gYnV0IG1vcmUgb24gdGhpcyBsYXRlciAoaXQgaXMgbG9uZyBhbmQgYm9yaW5nLCB5ZXQgaW1wb3J0YW50IHRvIGJlIGF3YXJlIG9mKS4gDQoNCkF0IHRoaXMgbGV2ZWwsIGlmIHlvdSBzZWUgYW4gZXJyb3IgaW4geW91ciBkYXRhIHNldCwgeW91IGNhbiBmaXggaXQgaW4gdGhlIGRhdGEgc2V0IHlvdSBpbXBvcnRlZCB1c2luZyBgcmVhZC50YWJsZWAgb3Igb3RoZXJzLiBIZXJlLCB5b3UgY2FuIGBmaXhgIGl0Og0KDQpgYGB7ciwgIGV2YWw9RkFMU0V9DQpmaXgoaXJpcykgIyBzcHJlYWRzaGVldA0KYGBgDQoNCiMgU2VsZWN0aW9uDQoNCiMjIENvbHVtbiBhbmQgcm93DQoNCkxldCdzIGFzc3VtZSBhbiBvbmxpbmUgZGF0YSBzZXQgZG9jdW1lbnRpbmcgdGhlIGhlaWdodCBhbmQgc2hvZSBzaXplIG9mIDEwIHN0dWRlbnRzIGluIFRhaXdhbjoNCg0KYGBge3IsICBldmFsPVR9DQpzdHVkZW50czwtcmVhZC50YWJsZSgnaHR0cHM6Ly93d3cuZGlwaW50b3RoZXJlZWYuY29tL3VwbG9hZHMvMy83LzMvNS8zNzM1OTI0NS9zdHVkZW50cy50eHQnLGhlYWRlcj1ULCBzZXA9Ilx0IiwgZGVjPScuJykgIyByZWFkIGRhdGEgc2V0IGZyb20gdXJsDQpzdHIoc3R1ZGVudHMpDQpgYGANCg0KQSBzaW5nbGUgY29sdW1uIChoZWlnaHQpIGlzIG5lZWRlZCBmb3IgZnVydGhlciBwcm9jZXNzaW5nLiBUaGlzIGlzIGFjY29tcGxpc2hlZCBieSB1c2luZyB0aGUgYCRgIG9wZXJhdG9yLiBBIGNvbHVtbiBpcyBzZWxlY3RlZCBieSBwdXR0aW5nIHRvZ2V0aGVyIG9uIHRoZSBzYW1lIGxpbmUgdGhlOg0KDQotIG5hbWUgb2YgdGhlIG9iamVjdCBgc3R1ZGVudHNgDQotIG9wZXJhdG9yIGAkYA0KLSBuYW1lIG9mIHRoZSBjb2x1bW4gYGhlaWdodGAsIGBzaG9lc2l6ZWAsIGBnZW5kZXJgLCBgcG9wdWxhdGlvbmAgICAgDQoNCkhlcmUgdG8gc2VsZWN0IHRoZSBjb2x1bW4gYGhlaWdodGAsIHdlIGNhbiBzaW1wbHkgdXNlIGBzdHVkZW50cyRoZWlnaHRgLiBUaGUgc2FtZSBjb2x1bW4gY2FuIGJlIGV4dHJhY3RlZCB1c2luZyAgKipzdWJzY3JpcHQqKiAgd2hpY2ggaXMgZGVub3RlZCBieSB0aGUgKipzcXVhcmUgYnJhY2tldHMqKiBhZnRlciB0aGUgb2JqZWN0IG5hbWUgc3VjaCBhcyBgb2JqZWN0IFtuby4gcm93LCBuby4gY29sdW1uXWAuIFRvIHNlbGVjdCB0aGUgZmlyc3QgY29sdW1uIG9mIG91ciBvYmplY3QgYHN0dWRlbnRzYCBjYW4gYWxzbyBiZSBhY2NvbXBsaXNoZWQgdXNpbmc6IGBzdHVkZW50c1ssMV1gDQoNCmBgYHtyLCAgZXZhbD1UfQ0KIyBzdHVkZW50c1ssMV0NCnN0dWRlbnRzJGhlaWdodA0KYGBgDQoNCkV4dHJhY3RpbmcgYSByb3cgY2FuIG9ubHkgYmUgYWNjb21wbGlzaGVkIHdpdGggYSBzdWJzY3JpcHQuIFRoZXJlZm9yZSwgdG8gZXh0cmFjdCB0aGUgZmlyc3Qgcm93IG9mIG91ciBkYXRhZnJhbWU6DQoNCmBgYHtyLCAgZXZhbD1UfQ0Kc3R1ZGVudHNbMSxdDQpgYGANCg0KTm93ICB0aGF0IHlvdSB1bmRlcnN0YW5kIGhvdyB0byBzZWxlY3QgY29sdW1uIGFuZCByb3csIHlvdSB3aWxsIGVzaWx5IHVuZGVyc3RhbmQgdGhlIGZvbGxvd2luZyBjaHVuayBvZiBjb2RlOiANCg0KYGBge3IsICBldmFsPUZBTFNFfQ0Kc3R1ZGVudHNbMSwxXSAjIGVsZW1lbnQgaW4gdGhlIGZpcnN0IHJvdywgZmlyc3QgY29sdW1uDQpzdHVkZW50cyRoZWlnaHRbMV0gIyBmaXJzdCBlbGVtZW50IGluIG91ciB2ZWN0b3IgaGVpZ2h0DQpgYGANCg0KPHNwYW4gc3R5bGU9ImNvbG9yOiByZWQiPkFsd2F5cyAqKnJlbWVtYmVyKiogYG9iamVjdFtuby4gcm93LCBuby4gY29sdW1uXWA8L3NwYW4+DQoNCiMjIFN1YnNldA0KDQpUaGUgcHVycG9zZSBpcyB0byAgZXh0cmFjdCBpbmZvcm1hdGlvbiBmb2xsb3dpbmcgYSBnaXZlbiBjb25kaXRpb24uIFN1Y2gsIHdlIG9ubHkgd2FudCB0byBzZWxlY3Qgb25seSBgZmVtYWxlYCBzdHVkZW50cyBmcm9tIHRoZSBgc3R1ZGVudHNgIGRhdGFzZXQuIFRoZSBzZWxlY3Rpb24gY2FuIGJlIG1hZGUgb24gc3R1ZGVudHMnIGBnZW5kZXJgOg0KDQoxLiBBZGQgYSBjb25kaXRpb24gYW5kIGNoZWNrIHdoZXRoZXIgb3Igbm90IHRoZSBvYnNlcnZhdGlvbiAocm93KSBpcyBmb3IgZmVtYWxlIHN0dWRlbnRzOg0KDQpgYGB7ciwgIGV2YWw9VH0NCnN0dWRlbnRzJGdlbmRlcj09ImZlbWFsZSIgIyBjb25kaXRpb24NCmBgYA0KDQoyLiBDcmVhdGUgYSAnZmlsdGVyJy4gTGV0J3MgY2FsbCBpdCBgZmA6IA0KDQpgYGB7ciwgIGV2YWw9VH0NCmY8LXN0dWRlbnRzJGdlbmRlcj09ImZlbWFsZSIgIyBmaWx0ZXINCmBgYCANCg0KMy4gQXBwbHkgdGhpcyBmaWx0ZXIgYGZgIHVzaW5nIHN1YnNjcmlwdC4gSSB3YW50IHRvIGV4dHJhY3Qvc2VsZWN0IG9ubHkgdGhlIHJvd3MgdGhhdCBjb250YWluIGRhdGEgZm9yIGBmZW1hbGVgIHN0dWRlbnRzLiBJIHB1dCB0aGUgcmVzdWx0aW5nIGRhdGEgaW4gYSBuZXcgb2JqZWN0IGNhbGwgYGZlbWFsZXNgOg0KDQpgYGB7ciwgIGV2YWw9VH0NCmZlbWFsZXM8LXN0dWRlbnRzW2YsXSAjIHNlbGVjdGlvbg0KZmVtYWxlcw0KYGBgDQoNCkl0IHNlbGVjdGVkIDUgc3R1ZGVudHMuIE15IG9yaWdpbmFsIGBzdHVkZW50c2AgZGF0YSBzZXQgaGFkIHRlbiBvYnNlcnZhdGlvbnMsIGFuZCBJIGNhbiBjaGVjayB0aGUgZGltZW5zaW9ucyBvZiBteSBuZXcgb2JqZWN0IGBmZW1hbGVzYCB1c2luZyBgZGltKGZlbWFsZXMpYC4gTXkgbmV3IGBkYXRhLmZyYW1lYCBpcyBhIHRhYmxlIG9mIDUgb2JzZXJ2YXRpb25zIGJ5IDQgY29sdW1ucy4gQ29sdW1uIG5hbWVzIGBjb2xuYW1lcyhmZW1hbGVzKWAgcmVtYWluZWQgdW5jaGFuZ2VkLCBidXQgSSBoYXZlIG5vdyBvbmx5IDUgbmFtZXMgZm9yIHRoZSByb3dzIGByb3duYW1lcyhmZW1hbGVzKWAuIEkgY2FuIHJlbmFtZSBteSBgcm93bmFtZXNgIGJ5ICBjb21iaW5pbmcgbmFtZXMgaW50byBhIHZlY3RvciAgYGNgLiANCg0KYGBge3IsICBldmFsPVR9DQpyb3duYW1lcyhmZW1hbGVzKTwtYygnVmFuZXNzYScsICdWaWNreScsICdNaWNoZWxsZScsICdKb3ljZScsICdWaWN0b3JpYScpDQpmZW1hbGVzDQpgYGAgDQoNCjxwIGNsYXNzPSJjb21tZW50Ij4NCioqUHJhY3RpY2UgMToqKiBVc2luZyBvdXIgYGlyaXNgIGRhdGEgc2V0LCBjcmVhdGUgdGhyZWUgZGlmZmVyZW50IGRhdGEgc2V0IGNvcnJlc3BvbmRpbmcgdG8gdGhlIHRocmVlIHNwZWNpZXMgZGVzaWduYXRlZCBpbiB0aGUgY29sdW1uIGBTcGVjaWVzYA0KPC9wPg0KDQpgYGB7ciwgY29kZV9mb2xkaW5nID0gJ1Nob3cgU29sdXRpb24nLCAgZXZhbD1GQUxTRX0NCiMgTk9UIFJVTjogIGxldmVscyhpcmlzJFNwZWNpZXMpDQpzZXRmPC1pcmlzJFNwZWNpZXM9PSJzZXRvc2EiDQpzZXRvc2E8LWlyaXNbc2V0ZixdDQp2ZXJmPC1pcmlzJFNwZWNpZXM9PSJ2ZXJzaWNvbG9yIg0KdmVyc2ljb2xvcjwtaXJpc1t2ZXJmLF0gDQp2aXJmPC1pcmlzJFNwZWNpZXM9PSJ2aXJnaW5pY2EiDQp2aXJnaW5pY2E8LWlyaXNbdmlyZixdIA0KYGBgDQoNCiMjIFNhbXBsZQ0KDQpUaGUgZnVuY3Rpb24gYHNhbXBsZWAgaXMgdXNlZCB0byBnZW5lcmF0ZSBhIHNhbXBsZSBvZiBhIHNwZWNpZmljIHNpemUgZnJvbSBhIHZlY3RvciBvciBhIGRhdGEgc2V0LCBlaXRoZXIgd2l0aCBvciB3aXRob3V0IHJlcGxhY2VtZW50Lg0KDQpUaGUgYmFzaWMgc3ludGF4IG9mIHRoZSBgc2FtcGxlYCBmdW5jdGlvbiBpcyBhcyBmb2xsb3dzOg0KDQpgYGB7ciBjbGFzcy5zb3VyY2UgPSAiZm9sZC1zaG93IiwgIGV2YWw9RkFMU0V9DQpzYW1wbGUoZGF0YSwgc2l6ZSwgcmVwbGFjZSA9IEZBTFNFLCBwcm9iID0gTlVMTCkNCiMgY2hlY2sgaW4gZGV0YWlsIHNvdXJjZSBjb2RlIA0KIyBWaWV3KHNhbXBsZSkgT1IgZ2V0QW55d2hlcmUoc2FtcGxlKCkpIA0KYGBgDQoNCipZb3UgY2FuIGNoZWNrIGluIGRldGFpbHMgd2hhdCB0aGUgZnVuY3Rpb24gaXMgZXhhY3RseSBkb2luZyBieSBjaGVja2luZyBpdHMgc291cmNlIGNvZGU6IGBWaWV3KHNhbXBsZSlgIE9SIGBnZXRBbnl3aGVyZShzYW1wbGUoKSlgLiBJdCBpcyBpbXBvcnRhbnQgaWYgeW91IHdhbm5hICBjYXJyeSBhIG1vZGlmaWNhdGlvbiBpbiBhbiBleGlzdGluZyBmdW5jdGlvbi4qICANCg0KDQpUbyBzZWxlY3QgcmFuZG9tbHkgdHdvIGluZGl2aWR1YWxzIGluIG91ciBgZmVtYWxlc2AgZGF0YSBzZXQ6ICgxKSBkZWZpbmUgdGhlIHNpemUgb2YgdGhlIHRhcmdldGVkIHZlY3RvcjsgKDIpIGNyZWF0ZSBmaWx0ZXIgd2l0aCBpbmRpdmlkdWFsKHMpIHJhbmRvbWx5IHNlbGVjdGVkOyAoMykgYXBwbHkgdGhlIGZpbHRlciBvbiB0aGUgZGF0YSBzZXQ6IA0KDQoNCmBgYHtyLCAgZXZhbD1UfQ0KIyBOT1QgUlVOLCBudW1iZXIgb2Ygcm93cyBpbiBmZW1hbGVzOiBucm93KGZlbWFsZXMpDQoxOm5yb3coZmVtYWxlcykgIyBjcmVhdGUgYSB2ZWN0b3IgZnJvbSAxIHRvIG5yb3coZmVtYWxlcykNCnNmPC1zYW1wbGUoMTpucm93KGZlbWFsZXMpLCAyKSAjIGZpbHRlciAyIGZlbWFsZSBzdHVkZW50cyBvbiBteSBpbml0aWFsIDUgZmVtYWxlIHN0dWRlbnRzDQpzZiAjIG15IHR3byBmZW1hbGUgc3R1ZGVudHMNCmZlbWFsZXNbc2YsXSAjIGFwcGx5IG15IGZpbHRlcg0KYGBgDQoNCiMgU29ydGluZw0KDQpTb3J0aW5nIGEgZGF0YSBmcmFtZSBpcyBkb25lIGJ5IGNvbWJpbmluZyBjb21tYW5kIGBvcmRlcmAgd2l0aCBhIHN1YnNjcmlwdC4gTGlrZSBmb3Igc3Vic2V0dGluZywgd2UgZmlyc3QgbmVlZCB0byBjcmVhdGUgYSB2ZWN0b3IgdGhhdCB3aWxsIHRlbGwgaW50byB3aGljaCBvcmRlciB0aGUgcm93cyBvZiB0aGUgdGFibGUgbmVlZCB0byBiZSBhcnJhbmdlZC4gT3JkZXIgYHN0dWRlbnRzYCBieSBpbmNyZWFzaW5nIGBoZWlnaHRgOg0KDQpgYGB7ciwgIGV2YWw9RkFMU0V9DQojIE5PVCBSVU4sIGluZCAxIHNob3VsZCBtb3ZlIGF0IHBvc2l0aW9uIDU6IHN0dWRlbnRzDQppbmQxPC1vcmRlciAoc3R1ZGVudHMkaGVpZ2h0KSAjIHZlY3RvciBvcmRlcg0Kc3R1ZGVudHMgW2luZDEsXSAjIHNvcnRpbmcgbXkgZGF0YSB3aXRoIG15IHZlY3RvciBvZiBvcmRlciwgY2hlY2sgaW5kLjEgaXMgYXQgcG9zaXRpb24gNSANCmBgYA0KDQpCb3RoIGNhbiBiZSBjb21iaW5lZCBpbnRvIDEgbGluZSB0byBiZSBtb3JlIGVsZWdhbnQgYW5kIHN5bnRoZXRpYzoNCg0KYGBge3IsICBldmFsPVR9DQpzdHVkZW50c1tvcmRlcihzdHVkZW50cyRoZWlnaHQpLF0NCmBgYA0KDQpZb3UgY2FuIG5vdyBndWVzcyB3aGF0IHRoZSBmb2xsb3dpbmcgdmVjdG9ycyB3aWxsIGRvOiANCg0KYGBge3IsICBldmFsPUZBTFNFfQ0KaW5kMjwtb3JkZXIoLXN0dWRlbnRzJGhlaWdodCkNCmBgYA0KDQpJdCBpcyB0aGUgZXF1aXZhbGVudCBvZiBgaW5kMzwtb3JkZXIoc3R1ZGVudHMkaGVpZ2h0LGRlY3JlYXNpbmcgPVQpYA0KDQoNCiMgUmVjb2RpbmcNCg0KUmVjb2RpbmcgaXMgcmVwbGFjaW5nIHZhbHVlcyB3aXRoIG5ldyBvbmVzLiBWYWx1ZXMgaW4gYSB2YXJpYWJsZSBjYW4gYmUgcmVjb2RlZCB1c2luZyB0aGUgY29tbWFuZCBgaWZlbHNlYC4gTGUncyByZWNvZGUgdGhlIGBnZW5kZXJgIHZhcmlhYmxlIGluIGBzdHVuZGVudHNgIHdpdGggdGhlIG5hbWUgb2YgZGlmZmVyZW50IGNvbG9ycy4gV2Ugd2lsbCByZXBsYWNlICBgbWFsZWAgd2l0aCBgYmx1ZWAgYW5kIGBmZW1hbGVgPWByZWRgLiBOb3RlIHRoYXQgd2Ugd2lsbCB1c2UgdGhlIG9wZXJhdG9yIGA9PWAgd2hpY2ggbWVhbnMgJ2VxdWFsIHRvJy4NCg0KYGBge3IsICBldmFsPVR9DQojIElmIGNvbmRpdGlvbiB0cnVlLCBpdCBnaXZlcyAnYmx1ZScuIElmIGZhbHNlLCBpdCBnaXZlcyByZWQuDQpjb2xvcnM8LWlmZWxzZShzdHVkZW50cyRnZW5kZXI9PSdtYWxlJywgJ2JsdWUnLCdyZWQnKSANCmNvbG9ycw0KYGBgDQoNCllvdSBjYW4gY3JlYXRlIGFuIG5ldyBjb2x1bW46DQoNCmBgYHtyLCAgZXZhbD1UfQ0Kc3R1ZGVudHMkY29sb3JzPC1pZmVsc2Uoc3R1ZGVudHMkZ2VuZGVyPT0nbWFsZScsJ2JsdWUnLCdyZWQnKSAjIGNyZWF0ZSBhIG5ldyBjb2x1bW4NCmBgYA0KDQpPciByZXBsYWNlIHRoZSBleGlzdGluZyBvbmU6IA0KDQpgYGB7ciwgIGV2YWw9Rn0NCnN0dWRlbnRzJGdlbmRlcjwtaWZlbHNlKHN0dWRlbnRzJGdlbmRlcj09J21hbGUnLCAnYmx1ZScsJ3JlZCcpICMgcmVwbGFjZSBhbiBleGlzdGluZyBjb2x1bW4NCmBgYA0KDQpNb3JlIG9wZXJhdG9ycywgd2hpY2ggY2FuIGJlIGNvbWJpbmVkIHRvZ2V0aGVyOg0KDQotIGA9PWAgZXF1YWwgdG8gDQoNCi0gYD49YCBlcXVhbCB0byBvciBncmVhdGVyIHRoYW4NCg0KLSBgPD1gIGVxdWFsIHRvIG9yIGxlc3MgdGhhbg0KDQotIGAhPWAgbm90IGVxdWFsIHRvDQoNCi0gYCZgIGFuZA0KDQotIGB8YCBvcg0KDQpFeGFtcGxlczoNCg0KYGBge3IsICBldmFsPUZ9DQpzdHVkZW50cyRoZWlnaHQgPD0gMTY1ICMgc3R1ZGVudHMgc2hvcnRlciBvciBlcXVhbCB0byAxNjUgY20NCnN0dWRlbnRzJHNob2VzaXplIDwgMzcgIyBzdHVkZW50cyB3aXRoIHNob2VzIHNpemUgc21hbGxlciB0aGFuIDM3DQpzdHVkZW50cyRoZWlnaHQgPD0gMTY1ICYgc3R1ZGVudHMkc2hvZXNpemUgPCAzNyAjIHN0dWRlbnRzIGVxdWFsIG9yIHNob3RlciB0aGFuIDE2NSBhbmQgc2hvZXMgc2l6ZSBzbWFsbGVyIHRoYW4gMzcNCiMgTk9UIFJVTjogc3R1ZGVudHMkZHVhbC5jb25kPC1pZmVsc2Uoc3R1ZGVudHMkaGVpZ2h0PD0xNjUgJiBzdHVkZW50cyRzaG9lc2l6ZTwzNywnYmx1ZScsJ3JlZCcpIA0KYGBgDQoNCjxwIGNsYXNzPSJjb21tZW50Ij4NCioqUHJhY3RpY2UgMjoqKiBVc2luZyB0aGUgYGlyaXNgIGRhdGFzZXQgY3JlYXRlIGEgbmV3IHZhcmlhYmxlIHdpdGggZmxvd2VyIGNvbG9ycy4gSXJpcyBzZXRvc2EgaXMgcHVycGxlLklyaXMgdmVyc2ljb2xvciBpcyBibHVlLiBJcmlzIHZpcmdpbmljYSBpcyBwaW5rLiBTb3J0IGluZGl2aWR1YWxzIGJ5IGRlY3JlYXNpbmcgYFNlcGFsLldpZHRoYC4gV2hhdCBjYW4geW91IGh5cG90aGVzaXplIG9uIHRoZSBzaXplIG9mIHNlcGFsIGZvciB0aGVzZSB0aHJlZSBzcGVjaWVzLiBHZXQgYmFjayB0aGUgZGF0YSBzZXQgZm9yIHRoZSBzcGVjaWVzIGhhdmluZyB0aGUgc21hbGxlc3Qgc2VwYWwgd2lkdGguIERlbGV0ZSB0aGUgdmFyaWFibGUgYGNvbG9yYCBpbiB0aGlzIHN1YnNldDwvc3Bhbj4qIA0KPC9wPg0KDQpgYGB7ciwgY29kZV9mb2xkaW5nID0gJ1Nob3cgU29sdXRpb24nLCAgZXZhbD1GQUxTRX0NCiMgYGlyaXNgIGRhdGFzZXQNCmlyaXMkY29sb3I8LWlmZWxzZShpcmlzJFNwZWNpZXM9PSdzZXRvc2EnLCdwdXJwbGUnLCBpZmVsc2UoaXJpcyRTcGVjaWVzPT0ndmVyc2ljb2xvcicsJ2JsdWUnLCdwaW5rJykpDQppcmlzW29yZGVyKGlyaXMkU2VwYWwuV2lkdGgsIGRlY3JlYXNpbmcgPSBUKSxdDQpgYGANCg0KKlRvIGRlbGV0ZSBhIHZhcmlhYmxlLCB0aGlzIHZhcmlhYmxlIHdpbGwgcmVjZWl2ZWQgYE5VTExgKg0KDQpUaG9zZSBhcmUgZnVuY3Rpb25zIGluIFIgQmFzZSBQYWNrYWdlLiBTZWUgYWxzbyBgP3N1YnNldGAsIGA/d2l0aGAsIGA/d2l0aGluYCwgZXRjLiBPdGhlciBwYWNrYWdlcyBzdWNoIGFzIHRoZSBwYWNrYWdlcyBgZGF0YS50YWJsZWAsIGBnZ3Bsb3QyYCwgYHJlc2hhcGUyYCwgYGRwbHlyYCBldGMuIG9mZmVyIHVzZWZ1bCBmdW5jdGlvbmFsaXR5IGZvciBtYW5pcHVsYXRpbmcgZGF0YSBzZXQu" download="manipulation.Rmd">Download manipulation.Rmd</a>`{=html}

</div>


<div class="layout-chunk" data-layout="l-body">
`<a href="data:text/plain;base64,bGlicmFyeSAoZGF0YXNldHMpICMgbG9hZCBwYWNrYWdlDQpybShsaXN0PWxzKCkpICMgY2xlYW4gbWVtb3J5DQpkYXRhKGlyaXMpICMgaW1wb3J0IGRhdGFzZXQNCmhlYWQgKGlyaXMpICMgdmlzdWFsaXplICdoZWFkJyBkYXRhc2V0DQojIG5vdGUgdGhhdCB1c2luZyBkYXRhIGF1dG9tYXRpY2FsbHkgY3JlYXRlIGFuIG9iamVjdCBjYWxsZWQgJ2lyaXMnDQoNCnN1bW1hcnkoaXJpcykgIyAgb2JqZWN0IHN1bW1hcnkNCg0Kc3RyKGlyaXMpICMgZXhhbWluZSB0aGUgc3RydWN0dXJlIG9mIHRoZSBvYmplY3QNCg0KZml4KGlyaXMpICMgc3ByZWFkc2hlZXQNCg0Kc3R1ZGVudHM8LXJlYWQudGFibGUoJ2h0dHBzOi8vd3d3LmRpcGludG90aGVyZWVmLmNvbS91cGxvYWRzLzMvNy8zLzUvMzczNTkyNDUvc3R1ZGVudHMudHh0JyxoZWFkZXI9VCwgc2VwPSJcdCIsIGRlYz0nLicpICMgcmVhZCBkYXRhIHNldCBmcm9tIHVybA0Kc3RyKHN0dWRlbnRzKQ0KDQojIHN0dWRlbnRzWywxXQ0Kc3R1ZGVudHMkaGVpZ2h0DQoNCnN0dWRlbnRzWzEsXQ0KDQpzdHVkZW50c1sxLDFdICMgZWxlbWVudCBpbiB0aGUgZmlyc3Qgcm93LCBmaXJzdCBjb2x1bW4NCnN0dWRlbnRzJGhlaWdodFsxXSAjIGZpcnN0IGVsZW1lbnQgaW4gb3VyIHZlY3RvciBoZWlnaHQNCg0Kc3R1ZGVudHMkZ2VuZGVyPT0iZmVtYWxlIiAjIGNvbmRpdGlvbg0KDQpmPC1zdHVkZW50cyRnZW5kZXI9PSJmZW1hbGUiICMgZmlsdGVyDQoNCmZlbWFsZXM8LXN0dWRlbnRzW2YsXSAjIHNlbGVjdGlvbg0KZmVtYWxlcw0KDQpyb3duYW1lcyhmZW1hbGVzKTwtYygnVmFuZXNzYScsICdWaWNreScsICdNaWNoZWxsZScsICdKb3ljZScsICdWaWN0b3JpYScpDQpmZW1hbGVzDQoNCiMgTk9UIFJVTjogIGxldmVscyhpcmlzJFNwZWNpZXMpDQpzZXRmPC1pcmlzJFNwZWNpZXM9PSJzZXRvc2EiDQpzZXRvc2E8LWlyaXNbc2V0ZixdDQp2ZXJmPC1pcmlzJFNwZWNpZXM9PSJ2ZXJzaWNvbG9yIg0KdmVyc2ljb2xvcjwtaXJpc1t2ZXJmLF0gDQp2aXJmPC1pcmlzJFNwZWNpZXM9PSJ2aXJnaW5pY2EiDQp2aXJnaW5pY2E8LWlyaXNbdmlyZixdIA0KDQpzYW1wbGUoZGF0YSwgc2l6ZSwgcmVwbGFjZSA9IEZBTFNFLCBwcm9iID0gTlVMTCkNCiMgY2hlY2sgaW4gZGV0YWlsIHNvdXJjZSBjb2RlIA0KIyBWaWV3KHNhbXBsZSkgT1IgZ2V0QW55d2hlcmUoc2FtcGxlKCkpIA0KDQojIE5PVCBSVU4sIG51bWJlciBvZiByb3dzIGluIGZlbWFsZXM6IG5yb3coZmVtYWxlcykNCjE6bnJvdyhmZW1hbGVzKSAjIGNyZWF0ZSBhIHZlY3RvciBmcm9tIDEgdG8gbnJvdyhmZW1hbGVzKQ0Kc2Y8LXNhbXBsZSgxOm5yb3coZmVtYWxlcyksIDIpICMgZmlsdGVyIDIgZmVtYWxlIHN0dWRlbnRzIG9uIG15IGluaXRpYWwgNSBmZW1hbGUgc3R1ZGVudHMNCnNmICMgbXkgdHdvIGZlbWFsZSBzdHVkZW50cw0KZmVtYWxlc1tzZixdICMgYXBwbHkgbXkgZmlsdGVyDQoNCiMgTk9UIFJVTiwgaW5kIDEgc2hvdWxkIG1vdmUgYXQgcG9zaXRpb24gNTogc3R1ZGVudHMNCmluZDE8LW9yZGVyIChzdHVkZW50cyRoZWlnaHQpICMgdmVjdG9yIG9yZGVyDQpzdHVkZW50cyBbaW5kMSxdICMgc29ydGluZyBteSBkYXRhIHdpdGggbXkgdmVjdG9yIG9mIG9yZGVyLCBjaGVjayBpbmQuMSBpcyBhdCBwb3NpdGlvbiA1IA0KDQpzdHVkZW50c1tvcmRlcihzdHVkZW50cyRoZWlnaHQpLF0NCg0KaW5kMjwtb3JkZXIoLXN0dWRlbnRzJGhlaWdodCkNCg0KIyBJZiBjb25kaXRpb24gdHJ1ZSwgaXQgZ2l2ZXMgJ2JsdWUnLiBJZiBmYWxzZSwgaXQgZ2l2ZXMgcmVkLg0KY29sb3JzPC1pZmVsc2Uoc3R1ZGVudHMkZ2VuZGVyPT0nbWFsZScsICdibHVlJywncmVkJykgDQpjb2xvcnMNCg0Kc3R1ZGVudHMkY29sb3JzPC1pZmVsc2Uoc3R1ZGVudHMkZ2VuZGVyPT0nbWFsZScsJ2JsdWUnLCdyZWQnKSAjIGNyZWF0ZSBhIG5ldyBjb2x1bW4NCg0Kc3R1ZGVudHMkZ2VuZGVyPC1pZmVsc2Uoc3R1ZGVudHMkZ2VuZGVyPT0nbWFsZScsICdibHVlJywncmVkJykgIyByZXBsYWNlIGFuIGV4aXN0aW5nIGNvbHVtbg0KDQpzdHVkZW50cyRoZWlnaHQgPD0gMTY1ICMgc3R1ZGVudHMgc2hvcnRlciBvciBlcXVhbCB0byAxNjUgY20NCnN0dWRlbnRzJHNob2VzaXplIDwgMzcgIyBzdHVkZW50cyB3aXRoIHNob2VzIHNpemUgc21hbGxlciB0aGFuIDM3DQpzdHVkZW50cyRoZWlnaHQgPD0gMTY1ICYgc3R1ZGVudHMkc2hvZXNpemUgPCAzNyAjIHN0dWRlbnRzIGVxdWFsIG9yIHNob3RlciB0aGFuIDE2NSBhbmQgc2hvZXMgc2l6ZSBzbWFsbGVyIHRoYW4gMzcNCiMgTk9UIFJVTjogc3R1ZGVudHMkZHVhbC5jb25kPC1pZmVsc2Uoc3R1ZGVudHMkaGVpZ2h0PD0xNjUgJiBzdHVkZW50cyRzaG9lc2l6ZTwzNywnYmx1ZScsJ3JlZCcpIA0KDQojIGBpcmlzYCBkYXRhc2V0DQppcmlzJGNvbG9yPC1pZmVsc2UoaXJpcyRTcGVjaWVzPT0nc2V0b3NhJywncHVycGxlJywgaWZlbHNlKGlyaXMkU3BlY2llcz09J3ZlcnNpY29sb3InLCdibHVlJywncGluaycpKQ0KaXJpc1tvcmRlcihpcmlzJFNlcGFsLldpZHRoLCBkZWNyZWFzaW5nID0gVCksXQ0KYGBgey5yIC5kaXN0aWxsLWZvcmNlLWhpZ2hsaWdodGluZy1jc3N9DQpgYGANCg==" download="manipulation.R">Download manipulation.R</a>`{=html}

</div>


Data manipulation involves modifying data to make it easier to read and to be more organized. We manipulate data for visualization and analysis. It is also used and combined with the term ‘data exploration’ which involves organizing data using available sets of variables. At times, the data collection process done by machines involves a lot of errors and inaccuracies in reading. Data manipulation is also used to remove these inaccuracies and make data more accurate and precise.

# Dataset

The package `datasets` provides datasets. It is part of the Base R datasets and used in many examples in the R help. Among those data sets, `iris` (`?iris`) gives the measurements in centimeters of the variables sepal length and width and petal length and width, respectively, for 50 flowers from each of 3 species of iris. The species are *Iris setosa*, *versicolor*, and *virginica*.    

<div class="layout-chunk" data-layout="l-body">
<div class="sourceCode"><pre class="sourceCode r"><code class="sourceCode r"><span class='kw'><a href='https://rdrr.io/r/base/library.html'>library</a></span> <span class='op'>(</span><span class='va'>datasets</span><span class='op'>)</span> <span class='co'># load package</span>
<span class='fu'><a href='https://rdrr.io/r/base/rm.html'>rm</a></span><span class='op'>(</span>list<span class='op'>=</span><span class='fu'><a href='https://rdrr.io/r/base/ls.html'>ls</a></span><span class='op'>(</span><span class='op'>)</span><span class='op'>)</span> <span class='co'># clean memory</span>
<span class='fu'><a href='https://rdrr.io/r/utils/data.html'>data</a></span><span class='op'>(</span><span class='va'>iris</span><span class='op'>)</span> <span class='co'># import dataset</span>
<span class='fu'><a href='https://rdrr.io/r/utils/head.html'>head</a></span> <span class='op'>(</span><span class='va'>iris</span><span class='op'>)</span> <span class='co'># visualize 'head' dataset</span>
</code></pre></div>

```
  Sepal.Length Sepal.Width Petal.Length Petal.Width Species
1          5.1         3.5          1.4         0.2  setosa
2          4.9         3.0          1.4         0.2  setosa
3          4.7         3.2          1.3         0.2  setosa
4          4.6         3.1          1.5         0.2  setosa
5          5.0         3.6          1.4         0.2  setosa
6          5.4         3.9          1.7         0.4  setosa
```

<div class="sourceCode"><pre class="sourceCode r"><code class="sourceCode r"><span class='co'># note that using data automatically create an object called 'iris'</span>
</code></pre></div>

</div>


Summarize this dataset: 

<div class="layout-chunk" data-layout="l-body">
<div class="sourceCode"><pre class="sourceCode r"><code class="sourceCode r"><span class='fu'><a href='https://rdrr.io/r/base/summary.html'>summary</a></span><span class='op'>(</span><span class='va'>iris</span><span class='op'>)</span> <span class='co'>#  object summary</span>
</code></pre></div>

```
  Sepal.Length    Sepal.Width     Petal.Length    Petal.Width   
 Min.   :4.300   Min.   :2.000   Min.   :1.000   Min.   :0.100  
 1st Qu.:5.100   1st Qu.:2.800   1st Qu.:1.600   1st Qu.:0.300  
 Median :5.800   Median :3.000   Median :4.350   Median :1.300  
 Mean   :5.843   Mean   :3.057   Mean   :3.758   Mean   :1.199  
 3rd Qu.:6.400   3rd Qu.:3.300   3rd Qu.:5.100   3rd Qu.:1.800  
 Max.   :7.900   Max.   :4.400   Max.   :6.900   Max.   :2.500  
       Species  
 setosa    :50  
 versicolor:50  
 virginica :50  
                
                
                
```

</div>


You can examine the `class` (type) of the object you are manipulating. Examining its structure `str` is essential to understand the variables you have.

<div class="layout-chunk" data-layout="l-body">
<div class="sourceCode"><pre class="sourceCode r"><code class="sourceCode r"><span class='fu'><a href='https://rdrr.io/r/utils/str.html'>str</a></span><span class='op'>(</span><span class='va'>iris</span><span class='op'>)</span> <span class='co'># examine the structure of the object</span>
</code></pre></div>

```
'data.frame':	150 obs. of  5 variables:
 $ Sepal.Length: num  5.1 4.9 4.7 4.6 5 5.4 4.6 5 4.4 4.9 ...
 $ Sepal.Width : num  3.5 3 3.2 3.1 3.6 3.9 3.4 3.4 2.9 3.1 ...
 $ Petal.Length: num  1.4 1.4 1.3 1.5 1.4 1.7 1.4 1.5 1.4 1.5 ...
 $ Petal.Width : num  0.2 0.2 0.2 0.2 0.2 0.4 0.3 0.2 0.2 0.1 ...
 $ Species     : Factor w/ 3 levels "setosa","versicolor",..: 1 1 1 1 1 1 1 1 1 1 ...
```

</div>


The object `iris` is a `data.frame` and is composed of 5 variables (`Sepal.Length`, `Sepal.Width`, `Petal.Length`, `Petal.Width`) and 150 observations. Four variables are numeric, one is a factor with 3 levels (`Species`). Other object types and structures also exist: data frame,  factor, integer, matrix, etc. but more on this later (it is long and boring, yet important to be aware of). 

At this level, if you see an error in your data set, you can fix it in the data set you imported using `read.table` or others. Here, you can `fix` it:

<div class="layout-chunk" data-layout="l-body">
<div class="sourceCode"><pre class="sourceCode r"><code class="sourceCode r"><span class='fu'><a href='https://rdrr.io/r/utils/fix.html'>fix</a></span><span class='op'>(</span><span class='va'>iris</span><span class='op'>)</span> <span class='co'># spreadsheet</span>
</code></pre></div>

</div>


# Selection

## Column and row

Let's assume an online data set documenting the height and shoe size of 10 students in Taiwan:

<div class="layout-chunk" data-layout="l-body">
<div class="sourceCode"><pre class="sourceCode r"><code class="sourceCode r"><span class='va'>students</span><span class='op'>&lt;-</span><span class='fu'><a href='https://rdrr.io/r/utils/read.table.html'>read.table</a></span><span class='op'>(</span><span class='st'>'https://www.dipintothereef.com/uploads/3/7/3/5/37359245/students.txt'</span>,header<span class='op'>=</span><span class='cn'>T</span>, sep<span class='op'>=</span><span class='st'>"\t"</span>, dec<span class='op'>=</span><span class='st'>'.'</span><span class='op'>)</span> <span class='co'># read data set from url</span>
<span class='fu'><a href='https://rdrr.io/r/utils/str.html'>str</a></span><span class='op'>(</span><span class='va'>students</span><span class='op'>)</span>
</code></pre></div>

```
'data.frame':	10 obs. of  4 variables:
 $ height    : int  167 164 166 162 158 175 181 180 177 173
 $ shoesize  : int  38 39 38 37 36 42 44 43 43 41
 $ gender    : chr  "female" "female" "female" "female" ...
 $ population: chr  "taiwan" "taiwan" "taiwan" "taiwan" ...
```

</div>


A single column (height) is needed for further processing. This is accomplished by using the `$` operator. A column is selected by putting together on the same line the:

- name of the object `students`
- operator `$`
- name of the column `height`, `shoesize`, `gender`, `population`    

Here to select the column `height`, we can simply use `students$height`. The same column can be extracted using  **subscript**  which is denoted by the **square brackets** after the object name such as `object [no. row, no. column]`. To select the first column of our object `students` can also be accomplished using: `students[,1]`

<div class="layout-chunk" data-layout="l-body">
<div class="sourceCode"><pre class="sourceCode r"><code class="sourceCode r"><span class='co'># students[,1]</span>
<span class='va'>students</span><span class='op'>$</span><span class='va'>height</span>
</code></pre></div>

```
 [1] 167 164 166 162 158 175 181 180 177 173
```

</div>


Extracting a row can only be accomplished with a subscript. Therefore, to extract the first row of our dataframe:

<div class="layout-chunk" data-layout="l-body">
<div class="sourceCode"><pre class="sourceCode r"><code class="sourceCode r"><span class='va'>students</span><span class='op'>[</span><span class='fl'>1</span>,<span class='op'>]</span>
</code></pre></div>

```
  height shoesize gender population
1    167       38 female     taiwan
```

</div>


Now  that you understand how to select column and row, you will esily understand the following chunk of code: 

<div class="layout-chunk" data-layout="l-body">
<div class="sourceCode"><pre class="sourceCode r"><code class="sourceCode r"><span class='va'>students</span><span class='op'>[</span><span class='fl'>1</span>,<span class='fl'>1</span><span class='op'>]</span> <span class='co'># element in the first row, first column</span>
<span class='va'>students</span><span class='op'>$</span><span class='va'>height</span><span class='op'>[</span><span class='fl'>1</span><span class='op'>]</span> <span class='co'># first element in our vector height</span>
</code></pre></div>

</div>


<span style="color: red">Always **remember** `object[no. row, no. column]`</span>

## Subset

The purpose is to  extract information following a given condition. Such, we only want to select only `female` students from the `students` dataset. The selection can be made on students' `gender`:

1. Add a condition and check whether or not the observation (row) is for female students:

<div class="layout-chunk" data-layout="l-body">
<div class="sourceCode"><pre class="sourceCode r"><code class="sourceCode r"><span class='va'>students</span><span class='op'>$</span><span class='va'>gender</span><span class='op'>==</span><span class='st'>"female"</span> <span class='co'># condition</span>
</code></pre></div>

```
 [1]  TRUE  TRUE  TRUE  TRUE  TRUE FALSE FALSE FALSE FALSE FALSE
```

</div>


2. Create a 'filter'. Let's call it `f`: 

<div class="layout-chunk" data-layout="l-body">
<div class="sourceCode"><pre class="sourceCode r"><code class="sourceCode r"><span class='va'>f</span><span class='op'>&lt;-</span><span class='va'>students</span><span class='op'>$</span><span class='va'>gender</span><span class='op'>==</span><span class='st'>"female"</span> <span class='co'># filter</span>
</code></pre></div>

</div>


3. Apply this filter `f` using subscript. I want to extract/select only the rows that contain data for `female` students. I put the resulting data in a new object call `females`:

<div class="layout-chunk" data-layout="l-body">
<div class="sourceCode"><pre class="sourceCode r"><code class="sourceCode r"><span class='va'>females</span><span class='op'>&lt;-</span><span class='va'>students</span><span class='op'>[</span><span class='va'>f</span>,<span class='op'>]</span> <span class='co'># selection</span>
<span class='va'>females</span>
</code></pre></div>

```
  height shoesize gender population
1    167       38 female     taiwan
2    164       39 female     taiwan
3    166       38 female     taiwan
4    162       37 female     taiwan
5    158       36 female     taiwan
```

</div>


It selected 5 students. My original `students` data set had ten observations, and I can check the dimensions of my new object `females` using `dim(females)`. My new `data.frame` is a table of 5 observations by 4 columns. Column names `colnames(females)` remained unchanged, but I have now only 5 names for the rows `rownames(females)`. I can rename my `rownames` by  combining names into a vector  `c`. 

<div class="layout-chunk" data-layout="l-body">
<div class="sourceCode"><pre class="sourceCode r"><code class="sourceCode r"><span class='fu'><a href='https://rdrr.io/r/base/colnames.html'>rownames</a></span><span class='op'>(</span><span class='va'>females</span><span class='op'>)</span><span class='op'>&lt;-</span><span class='fu'><a href='https://rdrr.io/r/base/c.html'>c</a></span><span class='op'>(</span><span class='st'>'Vanessa'</span>, <span class='st'>'Vicky'</span>, <span class='st'>'Michelle'</span>, <span class='st'>'Joyce'</span>, <span class='st'>'Victoria'</span><span class='op'>)</span>
<span class='va'>females</span>
</code></pre></div>

```
         height shoesize gender population
Vanessa     167       38 female     taiwan
Vicky       164       39 female     taiwan
Michelle    166       38 female     taiwan
Joyce       162       37 female     taiwan
Victoria    158       36 female     taiwan
```

</div>


<p class="comment">
**Practice 1:** Using our `iris` data set, create three different data set corresponding to the three species designated in the column `Species`
</p>

<div class="layout-chunk" data-layout="l-body">
<details>
<summary>Show Solution</summary>
<div class="sourceCode"><pre class="sourceCode r"><code class="sourceCode r"><span class='co'># NOT RUN:  levels(iris$Species)</span>
<span class='va'>setf</span><span class='op'>&lt;-</span><span class='va'>iris</span><span class='op'>$</span><span class='va'>Species</span><span class='op'>==</span><span class='st'>"setosa"</span>
<span class='va'>setosa</span><span class='op'>&lt;-</span><span class='va'>iris</span><span class='op'>[</span><span class='va'>setf</span>,<span class='op'>]</span>
<span class='va'>verf</span><span class='op'>&lt;-</span><span class='va'>iris</span><span class='op'>$</span><span class='va'>Species</span><span class='op'>==</span><span class='st'>"versicolor"</span>
<span class='va'>versicolor</span><span class='op'>&lt;-</span><span class='va'>iris</span><span class='op'>[</span><span class='va'>verf</span>,<span class='op'>]</span> 
<span class='va'>virf</span><span class='op'>&lt;-</span><span class='va'>iris</span><span class='op'>$</span><span class='va'>Species</span><span class='op'>==</span><span class='st'>"virginica"</span>
<span class='va'>virginica</span><span class='op'>&lt;-</span><span class='va'>iris</span><span class='op'>[</span><span class='va'>virf</span>,<span class='op'>]</span> 
</code></pre></div>

</details>

</div>


## Sample

The function `sample` is used to generate a sample of a specific size from a vector or a data set, either with or without replacement.

The basic syntax of the `sample` function is as follows:

<div class="layout-chunk" data-layout="l-body">
<div class="sourceCode"><pre class="sourceCode r"><code class="sourceCode r"><span class='fu'><a href='https://rdrr.io/r/base/sample.html'>sample</a></span><span class='op'>(</span><span class='va'>data</span>, <span class='va'>size</span>, replace <span class='op'>=</span> <span class='cn'>FALSE</span>, prob <span class='op'>=</span> <span class='cn'>NULL</span><span class='op'>)</span>
<span class='co'># check in detail source code </span>
<span class='co'># View(sample) OR getAnywhere(sample()) </span>
</code></pre></div>

</div>


*You can check in details what the function is exactly doing by checking its source code: `View(sample)` OR `getAnywhere(sample())`. It is important if you wanna  carry a modification in an existing function.*  


To select randomly two individuals in our `females` data set: (1) define the size of the targeted vector; (2) create filter with individual(s) randomly selected; (3) apply the filter on the data set: 


<div class="layout-chunk" data-layout="l-body">
<div class="sourceCode"><pre class="sourceCode r"><code class="sourceCode r"><span class='co'># NOT RUN, number of rows in females: nrow(females)</span>
<span class='fl'>1</span><span class='op'>:</span><span class='fu'><a href='https://rdrr.io/r/base/nrow.html'>nrow</a></span><span class='op'>(</span><span class='va'>females</span><span class='op'>)</span> <span class='co'># create a vector from 1 to nrow(females)</span>
</code></pre></div>

```
[1] 1 2 3 4 5
```

<div class="sourceCode"><pre class="sourceCode r"><code class="sourceCode r"><span class='va'>sf</span><span class='op'>&lt;-</span><span class='fu'><a href='https://rdrr.io/r/base/sample.html'>sample</a></span><span class='op'>(</span><span class='fl'>1</span><span class='op'>:</span><span class='fu'><a href='https://rdrr.io/r/base/nrow.html'>nrow</a></span><span class='op'>(</span><span class='va'>females</span><span class='op'>)</span>, <span class='fl'>2</span><span class='op'>)</span> <span class='co'># filter 2 female students on my initial 5 female students</span>
<span class='va'>sf</span> <span class='co'># my two female students</span>
</code></pre></div>

```
[1] 5 2
```

<div class="sourceCode"><pre class="sourceCode r"><code class="sourceCode r"><span class='va'>females</span><span class='op'>[</span><span class='va'>sf</span>,<span class='op'>]</span> <span class='co'># apply my filter</span>
</code></pre></div>

```
         height shoesize gender population
Victoria    158       36 female     taiwan
Vicky       164       39 female     taiwan
```

</div>


# Sorting

Sorting a data frame is done by combining command `order` with a subscript. Like for subsetting, we first need to create a vector that will tell into which order the rows of the table need to be arranged. Order `students` by increasing `height`:

<div class="layout-chunk" data-layout="l-body">
<div class="sourceCode"><pre class="sourceCode r"><code class="sourceCode r"><span class='co'># NOT RUN, ind 1 should move at position 5: students</span>
<span class='va'>ind1</span><span class='op'>&lt;-</span><span class='fu'><a href='https://rdrr.io/r/base/order.html'>order</a></span> <span class='op'>(</span><span class='va'>students</span><span class='op'>$</span><span class='va'>height</span><span class='op'>)</span> <span class='co'># vector order</span>
<span class='va'>students</span> <span class='op'>[</span><span class='va'>ind1</span>,<span class='op'>]</span> <span class='co'># sorting my data with my vector of order, check ind.1 is at position 5 </span>
</code></pre></div>

</div>


Both can be combined into 1 line to be more elegant and synthetic:

<div class="layout-chunk" data-layout="l-body">
<div class="sourceCode"><pre class="sourceCode r"><code class="sourceCode r"><span class='va'>students</span><span class='op'>[</span><span class='fu'><a href='https://rdrr.io/r/base/order.html'>order</a></span><span class='op'>(</span><span class='va'>students</span><span class='op'>$</span><span class='va'>height</span><span class='op'>)</span>,<span class='op'>]</span>
</code></pre></div>

```
   height shoesize gender population
5     158       36 female     taiwan
4     162       37 female     taiwan
2     164       39 female     taiwan
3     166       38 female     taiwan
1     167       38 female     taiwan
10    173       41   male     taiwan
6     175       42   male     taiwan
9     177       43   male     taiwan
8     180       43   male     taiwan
7     181       44   male     taiwan
```

</div>


You can now guess what the following vectors will do: 

<div class="layout-chunk" data-layout="l-body">
<div class="sourceCode"><pre class="sourceCode r"><code class="sourceCode r"><span class='va'>ind2</span><span class='op'>&lt;-</span><span class='fu'><a href='https://rdrr.io/r/base/order.html'>order</a></span><span class='op'>(</span><span class='op'>-</span><span class='va'>students</span><span class='op'>$</span><span class='va'>height</span><span class='op'>)</span>
</code></pre></div>

</div>


It is the equivalent of `ind3<-order(students$height,decreasing =T)`


# Recoding

Recoding is replacing values with new ones. Values in a variable can be recoded using the command `ifelse`. Le's recode the `gender` variable in `stundents` with the name of different colors. We will replace  `male` with `blue` and `female`=`red`. Note that we will use the operator `==` which means 'equal to'.

<div class="layout-chunk" data-layout="l-body">
<div class="sourceCode"><pre class="sourceCode r"><code class="sourceCode r"><span class='co'># If condition true, it gives 'blue'. If false, it gives red.</span>
<span class='va'>colors</span><span class='op'>&lt;-</span><span class='fu'><a href='https://rdrr.io/r/base/ifelse.html'>ifelse</a></span><span class='op'>(</span><span class='va'>students</span><span class='op'>$</span><span class='va'>gender</span><span class='op'>==</span><span class='st'>'male'</span>, <span class='st'>'blue'</span>,<span class='st'>'red'</span><span class='op'>)</span> 
<span class='va'>colors</span>
</code></pre></div>

```
 [1] "red"  "red"  "red"  "red"  "red"  "blue" "blue" "blue" "blue"
[10] "blue"
```

</div>


You can create an new column:

<div class="layout-chunk" data-layout="l-body">
<div class="sourceCode"><pre class="sourceCode r"><code class="sourceCode r"><span class='va'>students</span><span class='op'>$</span><span class='va'>colors</span><span class='op'>&lt;-</span><span class='fu'><a href='https://rdrr.io/r/base/ifelse.html'>ifelse</a></span><span class='op'>(</span><span class='va'>students</span><span class='op'>$</span><span class='va'>gender</span><span class='op'>==</span><span class='st'>'male'</span>,<span class='st'>'blue'</span>,<span class='st'>'red'</span><span class='op'>)</span> <span class='co'># create a new column</span>
</code></pre></div>

</div>


Or replace the existing one: 

<div class="layout-chunk" data-layout="l-body">
<div class="sourceCode"><pre class="sourceCode r"><code class="sourceCode r"><span class='va'>students</span><span class='op'>$</span><span class='va'>gender</span><span class='op'>&lt;-</span><span class='fu'><a href='https://rdrr.io/r/base/ifelse.html'>ifelse</a></span><span class='op'>(</span><span class='va'>students</span><span class='op'>$</span><span class='va'>gender</span><span class='op'>==</span><span class='st'>'male'</span>, <span class='st'>'blue'</span>,<span class='st'>'red'</span><span class='op'>)</span> <span class='co'># replace an existing column</span>
</code></pre></div>

</div>


More operators, which can be combined together:

- `==` equal to 

- `>=` equal to or greater than

- `<=` equal to or less than

- `!=` not equal to

- `&` and

- `|` or

Examples:

<div class="layout-chunk" data-layout="l-body">
<div class="sourceCode"><pre class="sourceCode r"><code class="sourceCode r"><span class='va'>students</span><span class='op'>$</span><span class='va'>height</span> <span class='op'>&lt;=</span> <span class='fl'>165</span> <span class='co'># students shorter or equal to 165 cm</span>
<span class='va'>students</span><span class='op'>$</span><span class='va'>shoesize</span> <span class='op'>&lt;</span> <span class='fl'>37</span> <span class='co'># students with shoes size smaller than 37</span>
<span class='va'>students</span><span class='op'>$</span><span class='va'>height</span> <span class='op'>&lt;=</span> <span class='fl'>165</span> <span class='op'>&amp;</span> <span class='va'>students</span><span class='op'>$</span><span class='va'>shoesize</span> <span class='op'>&lt;</span> <span class='fl'>37</span> <span class='co'># students equal or shoter than 165 and shoes size smaller than 37</span>
<span class='co'># NOT RUN: students$dual.cond&lt;-ifelse(students$height&lt;=165 &amp; students$shoesize&lt;37,'blue','red') </span>
</code></pre></div>

</div>


<p class="comment">
**Practice 2:** Using the `iris` dataset create a new variable with flower colors. Iris setosa is purple.Iris versicolor is blue. Iris virginica is pink. Sort individuals by decreasing `Sepal.Width`. What can you hypothesize on the size of sepal for these three species. Get back the data set for the species having the smallest sepal width. Delete the variable `color` in this subset</span>* 
</p>

<div class="layout-chunk" data-layout="l-body">
<details>
<summary>Show Solution</summary>
<div class="sourceCode"><pre class="sourceCode r"><code class="sourceCode r"><span class='co'># `iris` dataset</span>
<span class='va'>iris</span><span class='op'>$</span><span class='va'>color</span><span class='op'>&lt;-</span><span class='fu'><a href='https://rdrr.io/r/base/ifelse.html'>ifelse</a></span><span class='op'>(</span><span class='va'>iris</span><span class='op'>$</span><span class='va'>Species</span><span class='op'>==</span><span class='st'>'setosa'</span>,<span class='st'>'purple'</span>, <span class='fu'><a href='https://rdrr.io/r/base/ifelse.html'>ifelse</a></span><span class='op'>(</span><span class='va'>iris</span><span class='op'>$</span><span class='va'>Species</span><span class='op'>==</span><span class='st'>'versicolor'</span>,<span class='st'>'blue'</span>,<span class='st'>'pink'</span><span class='op'>)</span><span class='op'>)</span>
<span class='va'>iris</span><span class='op'>[</span><span class='fu'><a href='https://rdrr.io/r/base/order.html'>order</a></span><span class='op'>(</span><span class='va'>iris</span><span class='op'>$</span><span class='va'>Sepal.Width</span>, decreasing <span class='op'>=</span> <span class='cn'>T</span><span class='op'>)</span>,<span class='op'>]</span>
</code></pre></div>

</details>

</div>


*To delete a variable, this variable will received `NULL`*

Those are functions in R Base Package. See also `?subset`, `?with`, `?within`, etc. Other packages such as the packages `data.table`, `ggplot2`, `reshape2`, `dplyr` etc. offer useful functionality for manipulating data set.
```{.r .distill-force-highlighting-css}
```
