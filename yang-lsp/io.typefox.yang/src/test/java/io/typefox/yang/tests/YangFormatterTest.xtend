package io.typefox.yang.tests

import com.google.inject.Inject
import org.eclipse.xtext.testing.formatter.FormatterTestHelper
import org.junit.Test

class YangFormatterTest extends AbstractYangTest {

	@Inject extension protected FormatterTestHelper

	@Test
	def void testFormatting_01() {
		assertFormatted[
			expectation = '''
				module mytestid {
				
				  yang-version 1.1;
				
				  yang-version 1.1;
				}
			'''
			toBeFormatted = '''
				module  mytestid  { yang-version   1.1 ; yang-version   1.1 ; }
			'''
		]
	}

    @Test
    def void testFormatting_02_multiline_string_replacement() {
        assertFormatted[
            expectation = '''
                module mytestid {
                
                  description
                    "35-columns------------------------ 35-columns------------------------
                     15-columns---- 35-columns------------------------
                     35-columns------------------------ 15-columns---- 15-columns----
                     35-columns------------------------
                    ";
                }
            '''
            toBeFormatted = '''
                module mytestid {
                        description "35-columns------------------------ 35-columns------------------------ 15-columns---- 35-columns------------------------ 35-columns------------------------ 15-columns---- 15-columns---- 35-columns------------------------";
                }
            '''
        ]
    }
    
    @Test
    def void testFormatting_03_singleline_description() {
        assertFormatted[
            expectation = '''
                module mytestid {
                
                  description
                    "35-columns------------------------ 15-columns----";
                }
            '''
            toBeFormatted = '''
                module mytestid {
                    description        "35-columns------------------------ 15-columns----";
                }
            '''
        ]
    }
    
    @Test
    def void testFormatting_04_additional_newlines_description() {
        assertFormatted[
            expectation = '''
                module mytestid {
                
                  description
                    "35-columns------------------------
                     
                     15-columns----
                    ";
                }
            '''
            toBeFormatted = '''
                module mytestid {
                    description        "35-columns------------------------
                    
                    15-columns----";
                }
            '''
        ]
    }
    
    @Test
    def void testFormatting_05_extra_long_line_description() {
        assertFormatted[
            expectation = '''
                module mytestid {
                
                  description
                    "35-columns------------------------
                     100-columns----------------------------------------------------------------------------------------
                     15-columns----
                    ";
                }
            '''
            toBeFormatted = '''
                module mytestid {
                    description        "35-columns------------------------ 100-columns----------------------------------------------------------------------------------------
                    15-columns----";
                }
            '''
        ]
    }
    
    @Test
    def void testFormatting_06() {
        assertFormatted[
            expectation = '''
                module mytestid {
                
                  yang-version 1.1;
                
                  module mytestid {
                
                    yang-version 1.1;
                
                    yang-version 1.1;
                  }
                }
            '''
            toBeFormatted = '''
                module  mytestid  { yang-version   1.1 ; module  mytestid  { yang-version   1.1 ; yang-version   1.1 ; } }
            '''
        ]
    }
    
    @Test
    def void testFormatting_07() {
        assertFormatted[
            expectation = '''
                module ietf-inet-types {
                
                  namespace "urn:ietf:params:xml:ns:yang:ietf-inet-types";
                
                  prefix "inet";
                
                  description
                    "This module contains a collection of generally useful derived
                     YANG data types for Internet addresses and related things.
                     
                     Copyright (c) 2013 IETF Trust and the persons identified as
                     authors of the code. All rights reserved.
                     
                     Redistribution and use in source and binary forms, with or
                     without modification, is permitted pursuant to, and subject
                     to the license terms contained in, the Simplified BSD License
                     set forth in Section 4.c of the IETF Trust's Legal Provisions
                     Relating to IETF Documents
                     (http://trustee.ietf.org/license-info).
                     
                     This version of this YANG module is part of RFC 6991; see
                     the RFC itself for full legal notices.
                    ";
                }
            '''
            toBeFormatted = '''
                module ietf-inet-types {
                
                  namespace "urn:ietf:params:xml:ns:yang:ietf-inet-types";
                  
                  prefix "inet";
                
                  description
                   "This module contains a collection of generally useful derived
                    YANG data types for Internet addresses and related things.
                
                    Copyright (c) 2013 IETF Trust and the persons identified as
                    authors of the code.  All rights reserved.
                
                    Redistribution and use in source and binary forms, with or
                    without modification, is permitted pursuant to, and subject
                    to the license terms contained in, the Simplified BSD License
                    set forth in Section 4.c of the IETF Trust's Legal Provisions
                    Relating to IETF Documents
                    (http://trustee.ietf.org/license-info).
                
                    This version of this YANG module is part of RFC 6991; see
                    the RFC itself for full legal notices.";
                }
            '''
        ]
    }
    
}
